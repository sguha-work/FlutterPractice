class ImageModel {
  String id = '';
  String imageData = '';
  String imagePath = '';
  String createdOn = '';
  Image(
      {String provided_id = '',
      String provided_imageData = '',
      String provided_imagePath = '',
      String provided_createdOn = ''}) {
    id = provided_id;
    imageData = provided_imageData;
    imagePath = provided_imagePath;
    createdOn = provided_createdOn;
  }
}
