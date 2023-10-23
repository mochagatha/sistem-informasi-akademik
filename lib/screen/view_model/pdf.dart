import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

Future<void> printPDF(
    String nama, int uh1, int uh2, int uh3, int uts, int uas) async {
  final pdf = pw.Document();
  int jml = uh1 + uh2 + uh3 + uts + uas;
  double avg = (uh1 + uh2 + uh3 + uts + uas) / 5;

  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text("Nama Sekolah: SMPN 1 BOURNO"),
                    pw.Text("Alamat: Bojonegoro"),
                    pw.Text("Nama: $nama"),
                  ],
                ),
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text("Kelas    : 7A"),
                    pw.Text("Semester : 2 (Dua)"),
                    pw.Text("Tahun Ajaran : 2023/2024"),
                  ],
                ),
              ],
            ),
            pw.Divider(),
            pw.Text("A. PENGETAHUAN"),
            pw.SizedBox(height: 3),
            pw.Table(
              border: pw.TableBorder.all(),
              children: [
                pw.TableRow(
                  children: [
                    pw.Container(
                      padding: const pw.EdgeInsets.all(8),
                      color: PdfColor.fromHex('#CCCCCC'),
                      alignment: pw.Alignment.center,
                      child: pw.Text("Mata Pelajaran"),
                    ),
                    pw.Container(
                      padding: const pw.EdgeInsets.all(8),
                      color: PdfColor.fromHex('#CCCCCC'),
                      alignment: pw.Alignment.center,
                      child: pw.Text("Nilai"),
                    ),
                  ],
                ),
                pw.TableRow(
                  children: [
                    pw.Container(
                      padding: const pw.EdgeInsets.all(8),
                      alignment: pw.Alignment.centerLeft,
                      child: pw.Text("Ulangan Harian 1"),
                    ),
                    pw.Container(
                      padding: const pw.EdgeInsets.all(8),
                      alignment: pw.Alignment.center,
                      child: pw.Text("$uh1"),
                    ),
                  ],
                ),
                pw.TableRow(
                  children: [
                    pw.Container(
                      padding: const pw.EdgeInsets.all(8),
                      alignment: pw.Alignment.centerLeft,
                      child: pw.Text("Ulangan Harian 2"),
                    ),
                    pw.Container(
                      padding: const pw.EdgeInsets.all(8),
                      alignment: pw.Alignment.center,
                      child: pw.Text("$uh2"),
                    ),
                  ],
                ),
                pw.TableRow(
                  children: [
                    pw.Container(
                      padding: const pw.EdgeInsets.all(8),
                      alignment: pw.Alignment.centerLeft,
                      child: pw.Text("Ulangan Harian 3"),
                    ),
                    pw.Container(
                      padding: const pw.EdgeInsets.all(8),
                      alignment: pw.Alignment.center,
                      child: pw.Text("$uh3"),
                    ),
                  ],
                ),
                pw.TableRow(
                  children: [
                    pw.Container(
                      padding: const pw.EdgeInsets.all(8),
                      alignment: pw.Alignment.centerLeft,
                      child: pw.Text("UTS"),
                    ),
                    pw.Container(
                      padding: const pw.EdgeInsets.all(8),
                      alignment: pw.Alignment.center,
                      child: pw.Text("$uts"),
                    ),
                  ],
                ),
                pw.TableRow(
                  children: [
                    pw.Container(
                      padding: const pw.EdgeInsets.all(8),
                      alignment: pw.Alignment.centerLeft,
                      child: pw.Text("UAS"),
                    ),
                    pw.Container(
                      padding: const pw.EdgeInsets.all(8),
                      alignment: pw.Alignment.center,
                      child: pw.Text("$uas"),
                    ),
                  ],
                ),
              ],
            ),
            pw.SizedBox(height: 20),
            pw.Table(
              border: pw.TableBorder.all(
                width: 1.5,
              ),
              children: [
                pw.TableRow(
                  children: [
                    pw.Container(
                      padding: const pw.EdgeInsets.all(8),
                      color: PdfColor.fromHex('#CCCCCC'),
                      alignment: pw.Alignment.center,
                      child: pw.Text("Rata-Rata"),
                    ),
                    pw.Container(
                      padding: const pw.EdgeInsets.all(8),
                      color: PdfColor.fromHex('#CCCCCC'),
                      alignment: pw.Alignment.center,
                      child: pw.Text("Jumlah"),
                    ),
                  ],
                ),
                pw.TableRow(
                  children: [
                    pw.Container(
                      padding: const pw.EdgeInsets.all(8),
                      alignment: pw.Alignment.center,
                      child: pw.Text("$avg"),
                    ),
                    pw.Container(
                      padding: const pw.EdgeInsets.all(8),
                      alignment: pw.Alignment.center,
                      child: pw.Text("$jml"),
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
      },
    ),
  );

  // Generate a PDF file
  final pdfBytes = await pdf.save();

  // Print the PDF
  Printing.layoutPdf(
    onLayout: (PdfPageFormat format) async => pdfBytes,
  );
}
