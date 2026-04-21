import 'dart:io';

import 'package:service/src/common.dart';
import 'package:third_party/third_party.dart';

enum UploadType {
  thumbNail
}

class ThirdPartyApiClient {
  final CommonErrorHandler _errorHandler;
  const ThirdPartyApiClient({
    required CommonErrorHandler commonErrorHandler,
  }) : _errorHandler = commonErrorHandler;


  Future<String> pickThumbNail({
    required String title,
    required String cancel,
    required String done,
  }) async => await _errorHandler.thirdParty(
          () async{
        final ImagePicker picker = ImagePicker();
        final XFile? image = await picker.pickImage(source: ImageSource.gallery,);
        if(image == null) {
          throw const DataError();
        }
        final ImageCropper crop = ImageCropper();
        final double imageSize = await _getMb(image.path);
        final String imagePath = await _cropImage(
            imageSize: imageSize,
            crop: crop,
            imagePath: image.path,
            uploadType: UploadType.thumbNail,
            title: title,
            done: done,
            cancel: cancel
        );
        return imagePath;
      });


  Future<String> _cropImage({
    required ImageCropper crop,
    required double imageSize,
    required String imagePath,
    required UploadType uploadType,
    required String title,
    required String cancel,
    required String done,
  }) async{


    // int quality = (90 - (currentSizeMB - targetSizeMB)* 10).clamp(10, 90).toInt();
    int quality = (90 / imageSize).clamp(30, 90).toInt();
    final croppedFile = await crop.cropImage(
        sourcePath: imagePath,
        compressFormat: ImageCompressFormat.jpg,
        compressQuality: quality,
        uiSettings: [
          AndroidUiSettings(
            // toolbarColor: const Color(0xff000000),
            // toolbarWidgetColor: const Color(0xFFFFFFFF),
            // backgroundColor: const Color(0xFF121212),
            // activeControlsWidgetColor: const Color(0xFF64B5F6),
            // dimmedLayerColor: const Color(0x99000000),
            toolbarTitle: title,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false,
            hideBottomControls: uploadType == UploadType.thumbNail,
            // cropGridColor: const Color(0xFF4FC3F7),
            // cropFrameColor: const Color(0xFFFFFFFF),
            cropStyle: uploadType == UploadType.thumbNail ? CropStyle.circle : CropStyle.rectangle,
          ),
          IOSUiSettings(
            title: title,
            cancelButtonTitle: cancel,
            doneButtonTitle: done,
            cropStyle:uploadType == UploadType.thumbNail ? CropStyle.circle : CropStyle.rectangle,
            rotateButtonsHidden: true,
            rotateClockwiseButtonHidden: true,
            aspectRatioPickerButtonHidden: true,
            resetButtonHidden: true,
          ),
        ]
    );
    if(croppedFile == null){
      // log('이미지 용량이 너무 큽니다.0 ${size}');
      // log('이미지 용량이 너무 큽니다.1 ${quality}');
      // log('이미지 용량이 너무 큽니다.2 ${(fileSize / 1024 / 1024).toStringAsFixed(2)}MB');

      if (imageSize > 2 ) { // 1MB 초과 체크
        final String imageSizeConvert = imageSize.toStringAsFixed(1);
        throw _error(imageSizeConvert);// 실패 처리
      }
      return imagePath;
    }

    final double cropSize = await _getMb(croppedFile.path);
    if (cropSize > 2 ) { // 1MB 초과 체크
      final String cropSizeConvert = cropSize.toStringAsFixed(1);

      throw _error(cropSizeConvert); // 실패 처리
    }
    return croppedFile.path;

  }

  DataError _error(String imageSizeConvert) => DataError(message: "이미지 업로드 허용 용량이 초과되었습니다. 다른 이미지를 사용하거나, 편집 화면에서 크기를 더 줄인 후 다시 시도해 주세요. (최대 2MB/ 현재 ${imageSizeConvert}MB)");


  Future<double> _getMb(String imagePath) async {
    final File file = File(imagePath);
    final int fileSize = await file.length(); // byte 단위
    final double sizeInMB = fileSize / (1024 * 1024);
    return sizeInMB;
  }


  Future<List<DadadocHospital>> getHospitalList({
    required int page,
    int pageSize = 20,
  }) => _errorHandler.serviceErrorHandler(
      onService: () async {
        final List<DadadocHospital> all = generateDummyHospitals();
        await Future.delayed(const Duration(milliseconds: 200));
        final start = page * pageSize;
        if (start >= all.length) return [];

        final end = (start + pageSize).clamp(0, all.length);
        return all.sublist(start, end);
      },
  );

  Future<DadadocChild> getChild({required String hospitalId}) async => await _errorHandler.serviceErrorHandler(
      onService: () async {
        final DadadocChild result = DadadocChild.dummy(hospitalId: hospitalId);
        await Future.delayed(const Duration(milliseconds: 200));
        return result;
      },
  );

  Future<DadadocHospitalDetail> getHospitalDetail({
    required DadadocHospital hospital,
  }) async => await _errorHandler.serviceErrorHandler(
    onService: () async {
      final DadadocHospitalDetail result = DadadocHospitalDetail(
        hospitalId: hospital.hospitalId,
        hospitalName: hospital.hospitalName,
        doctorName: hospital.doctorName,
        thumbnail: hospital.thumbnail,
        features: hospital.features,
        businessHours: hospital.businessHours,
        breakTimeHtml:  hospital.breakTimeHtml,
        noticeHtml: randomNoticeHtml(),
        historyHtml: randomHistoryHtml(hospital.hospitalName),
        introduceHtml: randomIntroduceHtml(hospital.hospitalName),
      );
      await Future.delayed(const Duration(milliseconds: 200));
      return result;
    },
  );







}