part of 'package:beer_and_games/features/beer_and_games/presentation/pages/rating_items_page.dart';

class _EditRatableItemBottomSheet extends StatefulWidget {
  const _EditRatableItemBottomSheet({required this.item});

  final RateableItem item;

  @override
  State<_EditRatableItemBottomSheet> createState() =>
      __EditRatableItemBottomSheetState();
}

class __EditRatableItemBottomSheetState
    extends State<_EditRatableItemBottomSheet> {
  final _titleHeigth = 80.0;
  final _bottomSheetHeigth = 250.0;
  final _padding = 32.0;

  late RateableItem _backupItem = widget.item is Beer
      ? (widget.item as Beer).copyWith()
      : (widget.item as Wine).copyWith();

  late final TextEditingController _nameController = TextEditingController(
    text: widget.item.name,
  );
  late final List<int> _imageBytes =
      widget.item.imageBytes?.toList() ?? <int>[];

  Offset? _tapPosition;

  bool get _canSave {
    return (widget.item.name != _nameController.text &&
            _nameController.text.isNotEmpty) ||
        !(const ListEquality().equals(widget.item.imageBytes, _imageBytes));
  }

  void _update(String name, List<int> image) {
    if (_backupItem is Beer) {
      _backupItem = (_backupItem as Beer)
          .copyWithDontOverrideNullable(name: name, imageBytes: image);
    } else if (_backupItem is Wine) {
      _backupItem =
          (_backupItem as Wine).copyWith(name: name, imageBytes: image);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ItemsBloc, ItemsState>(
      listenWhen: (previous, current) => current.maybeMap(
        update: (value) {
          final prevValue = previous.maybeMap(
            update: (value) => value,
            orElse: () => null,
          );
          if (prevValue == null) return true;

          if (widget.item is Beer) {
            final prevBeer = prevValue.beers
                .firstWhere((element) => element.id == widget.item.id);
            final beer = value.beers
                .firstWhere((element) => element.id == widget.item.id);
            return beer != prevBeer && beer == _backupItem;
          } else {
            final prevWine = prevValue.wines
                .firstWhere((element) => element.id == widget.item.id);
            final wine = value.wines
                .firstWhere((element) => element.id == widget.item.id);
            return wine != prevWine && wine == _backupItem;
          }
        },
        orElse: () => false,
      ),
      listener: (context, state) {
        state.maybeMap(
          update: (value) {
            context.pop();
            context.successSnackbar(
              'Modifica effettuata',
              'Le modifiche sono state apportate con successo',
            );
          },
          orElse: () {},
        );
      },
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          width: double.maxFinite,
          height: _titleHeigth + _bottomSheetHeigth + 20 + _padding * 2,
          padding: EdgeInsets.all(_padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _nameArea(),
              height50,
              _imageArea(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _nameArea() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Nome',
              style: context.textTheme.titleLarge
                  ?.copyWith(color: context.colorScheme.primary),
            ),
            IconButton(
              onPressed: () {
                if (!_canSave) {
                  context.showOkDialog(
                    'Attenzione',
                    'Nessuna modifica effettuata',
                  );
                  return;
                }
                _update(_nameController.text, _imageBytes);

                context.read<ItemsBloc>().add(
                      ItemsEvent.updateInfo(item: _backupItem),
                    );
              },
              icon: Icon(
                Icons.save_rounded,
                color: context.colorScheme.primary,
              ),
            ),
          ],
        ),
        height10,
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: _nameController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: context.colorScheme.primary,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          ),
        ),
      ],
    );
  }

  Widget _imageArea() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Immagine',
          style: context.textTheme.titleLarge
              ?.copyWith(color: context.colorScheme.primary),
        ),
        height10,
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: SizedBox.square(
              dimension: 150,
              child: GestureDetector(
                onTapDown: _storePosition,
                child: FilledButton(
                  onPressed: _handlePickPhoto,
                  onLongPress: _handleLongPress,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      MaterialTheme.darkScheme().surfaceContainerLow,
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.all(0),
                    ),
                  ),
                  child: _imageBytes.isNotEmpty
                      ? Image.memory(
                          Uint8List.fromList(_imageBytes),
                          fit: BoxFit.cover,
                        )
                      : const Icon(
                          Icons.image_not_supported_rounded,
                          size: 64,
                          color: Colors.grey,
                        ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _handlePickPhoto() async {
    final toolBarColor = context.colorScheme.primary;
    final toolBarWidgetColor = context.colorScheme.onPrimary;
    final backgroundColor = context.colorScheme.background;
    final selectedColor = context.colorScheme.primaryContainer;

    final picker = ImagePicker();
    final photoMode = await context.showSimpleChoiceDialog(
      'Foto',
      'Stai per selezionare una foto, da dove vuoi prenderla?',
      positiveAction: 'Fotocamera',
      negativeAction: 'Galleria',
      negativeActionColor: context.colorScheme.primary,
    );
    if (photoMode == null) return;

    final photo = await picker.pickImage(
        source: photoMode == true ? ImageSource.camera : ImageSource.gallery,
        maxWidth: 512,
        maxHeight: 512,
        imageQuality: 100);
    if (photo == null) return;

    final cropper = await ImageCropper().cropImage(
      sourcePath: photo.path,
      maxWidth: 512,
      maxHeight: 512,
      compressFormat: ImageCompressFormat.png,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
      ],
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Ritaglia l\'immagine',
          toolbarColor: toolBarColor,
          toolbarWidgetColor: toolBarWidgetColor,
          cropGridColor: toolBarColor,
          activeControlsWidgetColor: selectedColor,
          cropFrameColor: toolBarColor,
          dimmedLayerColor: backgroundColor,
          statusBarColor: toolBarColor,
          backgroundColor: backgroundColor,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        IOSUiSettings(
          title: 'Ritaglia l\'immagine',
          minimumAspectRatio: 1.0,
        ),
      ],
    );

    if (cropper == null) return;
    final bytes = await cropper.readAsBytes();
    _imageBytes.clear();
    _imageBytes.addAll(bytes);
    setState(() {});
  }

  void _storePosition(TapDownDetails details) {
    _tapPosition = details.globalPosition;
  }

  void _handleLongPress() {
    final overlay =
        Overlay.of(context).context.findRenderObject()! as RenderBox;

    showMenu(
      context: context,
      position: RelativeRect.fromRect(
        // smaller rect, the touch area
        _tapPosition! & const Size(40, 40),

        // Bigger rect, the entire screen
        Offset.zero & overlay.size,
      ),
      color: context.colorScheme.tertiaryContainer,
      items: [
        PopupMenuItem(
          value: 1,
          height: 10,
          onTap: () {
            setState(() {
              _imageBytes.clear();
            });
          },
          child: Row(
            children: [
              Icon(
                Icons.delete,
                color: context.colorScheme.onTertiaryContainer,
                size: context.textTheme.bodyLarge?.fontSize,
              ),
              width10,
              Text(
                'Elimina',
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.colorScheme.onTertiaryContainer,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
