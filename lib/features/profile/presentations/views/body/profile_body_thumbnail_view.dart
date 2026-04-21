import 'package:flutter/material.dart';
import 'package:maki_flutter_playground/features/profile/profile.dart';

class ProfileBodyThumbnailView extends StatelessWidget {
  const ProfileBodyThumbnailView({super.key});

  @override
  Widget build(BuildContext context) {

    final DsColor dsColor = Theme.of(context).extension<DsColor>()!;

    return BlocSelector<VmProfileImageBloc, VmProfileImageState, ({bool isDelete, String thumbnail})>(
        selector: (state) => (isDelete: state.isDelete, thumbnail: state.thumbnail,),
        builder: (context, image) =>
            BlocSelector<VmProfileValueBloc, VmProfileValueState, String>(
                selector: (state) => state.currentImage,
                builder: (context, currentImage) {

                  void pickImage() => context.read<VmProfileImageBloc>().add(
                    EventProfileImagePicker(
                      title: "이미지 수정",
                      done: "완료",
                      cancel: "취소",
                    ),
                  );

                  final Widget pickerButton = UiBottomSheetButton(
                    callback: pickImage,
                    icon: Icons.image_outlined,
                    text: "다른 이미지 선택하기",
                  );

                  final Widget cancelButton = image.thumbnail.isEmpty ? const SizedBox() : UiBottomSheetButton(
                    callback: () => context.read<VmProfileImageBloc>().add(const EventProfileImageCancel()),
                    icon: Icons.cancel_outlined,
                    text: "이미지 선택 취소",
                  );

                  final Widget deleteButton = UiBottomSheetButton(
                    callback: () => context.read<VmProfileImageBloc>().add(const EventProfileImageDelete()),
                    icon: Icons.delete_outline,
                    text: "이미지 삭제",
                    iconColor: dsColor.error,
                    textColor: dsColor.error,
                  );

                  final Widget resetButton = UiBottomSheetButton(
                    callback: () => context.read<VmProfileImageBloc>().add(const EventProfileImageReset()),
                    icon: Icons.refresh,
                    text: "이미지 되돌리기",
                  );

                  return UiLayout(
                    child: UiLayout(
                        child: UiProfileButton.large(
                          onPressedImage: (){
                            if(currentImage.isEmpty && image.thumbnail.isEmpty){
                              pickImage();
                            }
                            else{
                              context.read<BootstrapManager>().message.sheet.show(
                                  context: context,
                                  children: [pickerButton, cancelButton]
                              );
                            }
                          },
                          onPressedIcon: pickImage,
                          url: image.isDelete  ? '' : currentImage, fileUrl: image.thumbnail ,

                        )
                    ),
                  );
                }
            )
    );
  }
}







