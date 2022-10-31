class Utils {
  List getImages(String images) {
    String removingBraces = images.replaceAll('[', '').trim();

    removingBraces = removingBraces.replaceAll(']', '').trim();

    List splittedImages = removingBraces.split(',');

    return splittedImages;
  }
}
