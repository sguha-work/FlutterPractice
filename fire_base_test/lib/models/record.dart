class Record {
  String id = '';
  String description = '';
  String consumerId = '';
  String agentId = '';
  String regionCode = '';
  String imageId = '';
  String createdOn = '';

  Record(
      {String provided_id = '',
      String provided_description = '',
      String provided_consumerId = '',
      String provided_agentId = '',
      String provided_regionCode = '',
      String provided_imageId = '',
      String provided_createdOn = ''}) {
    id = provided_id;
    description = provided_description;
    consumerId = provided_consumerId;
    agentId = provided_agentId;
    regionCode = provided_regionCode;
    imageId = provided_imageId;
    createdOn = provided_createdOn;
  }
}
