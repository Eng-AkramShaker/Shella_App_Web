// ignore_for_file: prefer_const_literals_to_create_immutables, non_constant_identifier_names, camel_case_types, avoid_print

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shella_design/features/wallet_kaidha_subscription/controllers/kaidhaSub_controller.dart';
import 'package:shella_design/features/wallet_kaidha_subscription/domain/models/contract_pdf_model.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Contract_ReviewScreen extends StatefulWidget {
  const Contract_ReviewScreen({super.key});

  @override
  State<Contract_ReviewScreen> createState() => _Contract_ReviewScreenState();
}

class _Contract_ReviewScreenState extends State<Contract_ReviewScreen> {
  final PdfViewerController _pdfViewerController = PdfViewerController();
  ContractPdfModel? _pdfModel;
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadContractPdf();
  }

  Future<void> _loadContractPdf() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final pdfModel = Get.find<KaidhaSubscription_Controller>().contract_Pdf_Model;

      print("حجم الملف: ${pdfModel?.fileSize}");

      setState(() {
        _pdfModel = pdfModel;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'فشل تحميل العقد';
      });
      debugPrint('Error loading PDF: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("عرض العقد"))),
      body: _buildBody(),
      floatingActionButton: _buildPageControls(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_errorMessage != null) {
      return GetBuilder<KaidhaSubscription_Controller>(
        builder: (KaidhaSubController) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (KaidhaSubController.isLoading == true) const CircularProgressIndicator() else const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _loadContractPdf,
                  child: const Text("إعادة المحاولة"),
                ),
              ],
            ),
          );
        },
      );
    }

    if (_pdfModel == null) {
      return const Center(child: Text("لا يوجد عقد متاح"));
    }

    return SfPdfViewer.file(
      File(_pdfModel!.filePath),
      controller: _pdfViewerController,
      pageLayoutMode: PdfPageLayoutMode.single,
      canShowPaginationDialog: false,
    );
  }

  Widget _buildPageControls() {
    if (_pdfModel == null) return const SizedBox.shrink();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FloatingActionButton(
          heroTag: "next",
          mini: true,
          onPressed: () => _pdfViewerController.nextPage(),
          child: const Icon(Icons.chevron_left),
        ),
        const SizedBox(width: 20),
        FloatingActionButton(
          heroTag: "prev",
          mini: true,
          onPressed: () => _pdfViewerController.previousPage(),
          child: const Icon(Icons.chevron_right),
        ),
      ],
    );
  }
}
