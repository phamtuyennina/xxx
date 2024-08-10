part of '../account_screen.dart';

class _InfoAccountWidget extends ConsumerWidget {
  _InfoAccountWidget({super.key});
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final UserModel? userInfo = ref.watch(authUserProvider.select(
      (value) => value.userLogin,
    ));
    return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 30, left: 20, right: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    isScrollControlled: false,
                    useRootNavigator: true,
                    context: context,
                    builder: (contextModal) {
                      return Container(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewPadding.bottom,
                        ),
                        width: double.infinity,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              onTap: () {
                                Navigator.of(contextModal).pop();
                                _onPickFromCamera();
                              },
                              title: const Text(
                                'Camera',
                                style: TextStyle(fontSize: 17),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const Divider(
                              color: Color(0xfff2f2f2),
                            ),
                            ListTile(
                              onTap: () {
                                Navigator.of(contextModal).pop();
                                _onPickFromPhoto();
                              },
                              title: const Text(
                                'Thư viện ảnh',
                                style: TextStyle(fontSize: 17),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const Divider(
                              color: Color(0xfff2f2f2),
                            ),
                            ListTile(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              title: const Text(
                                'Huỷ',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    SizedBox(
                      width: 80,
                      height: 80,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(80),
                        child: (!Helper.isNull(userInfo?.avatar))
                            ? CachedNetworkImage(
                                imageUrl:
                                    '${MediaAssets.uploadUser}/${userInfo?.avatar}',
                                fit: BoxFit.cover,
                                placeholder: (context, url) => const Center(
                                  child: SizedBox(
                                    width: 18,
                                    height: 18,
                                    child: CircularProgressIndicator.adaptive(),
                                  ),
                                ),
                              )
                            : Image.asset(
                                MediaAssets.noImage,
                                width: 80,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    Positioned(
                      bottom: -3,
                      right: -3,
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffD9D9D9),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30)),
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        width: 30,
                        height: 30,
                        child: const Icon(
                          Icons.camera_alt_rounded,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    userInfo?.fullname ?? '',
                    style: const TextStyle(fontSize: 17),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    userInfo?.email ?? '',
                    style: const TextStyle(fontSize: 14),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    userInfo?.phone ?? '',
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
              Expanded(
                  child: Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    context.push(ProfileScreen.pathRoute);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5))),
                    child: const Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              )),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _onPickFromCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {}
  }

  Future<void> _onPickFromPhoto() async {
    final List<XFile> images = await _picker.pickMultiImage(limit: 4);
    if (images.isNotEmpty) {}
  }
}
