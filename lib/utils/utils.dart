class Utils{
  List getImages(String images){
    // print('Its utils....');
    String removingBraces = images.replaceAll( '[',  '').trim();
    // print(removingBraces);
    removingBraces = removingBraces.replaceAll( ']', '').trim();
    // print(removingBraces);
    List splittedImages = removingBraces.split(',');

    return splittedImages;
  }
}