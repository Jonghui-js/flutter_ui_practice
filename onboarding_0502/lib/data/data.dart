class SliderModel {
  String imagePath;
  String title;
  String desc;

  SliderModel({this.imagePath, this.title, this.desc});

  void setImageAssetPath(String getImagePath) {
    imagePath = getImagePath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDesc(String getDesc) {
    desc = getDesc;
  }

  String getImageAssetPath() {
    return imagePath;
  }

  String getTitle() {
    return title;
  }

  String getDesc() {
    return desc;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  sliderModel.setImageAssetPath(("assets/illustration.png"));
  sliderModel.setTitle("Search");
  sliderModel.setDesc(
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.");
  slides.add(sliderModel);

  sliderModel = new SliderModel();
  sliderModel.setImageAssetPath(("assets/illustration2.png"));
  sliderModel.setTitle("Order");
  sliderModel.setDesc(
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.");
  slides.add(sliderModel);

  sliderModel = new SliderModel();
  sliderModel.setImageAssetPath(("assets/illustration3.png"));
  sliderModel.setTitle("Eat");
  sliderModel.setDesc(
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.");
  slides.add(sliderModel);
  sliderModel = new SliderModel();

  return slides;
}
