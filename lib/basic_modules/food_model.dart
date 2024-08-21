class FoodModel {
  String title;
  String des;
  String image;
  String time;
  double price;
  double rate;

  FoodModel({
    this.title = "no title",
    this.des = "no des",
    this.image = "no image",
    this.time = "no time",
    this.price = 0.0,
    this.rate = 0.0,
  });

  @override
  String toString() {
    return "FoodModel(title=$title,des=$des,image=$image,time=$time,price=$price,rate=$rate)";
  }
}

List<FoodModel> foodList = [
  FoodModel(
    title: "Pizza",
    des: "This is pizza food",
    image:
        "https://plus.unsplash.com/premium_photo-1673439304183-8840bd0dc1bf?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    price: 10.0,
    time: "30 - 40 min",
    rate: 4.5,
  ),
  FoodModel(
    title: "Burger",
    des: "This is burger food",
    image:
        "https://images.unsplash.com/photo-1521305916504-4a1121188589?q=80&w=2960&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    price: 15.0,
    time: "10 - 20 min",
    rate: 3.5,
  ),
  FoodModel(
    title: "Spaghetti",
    des: "This is noodles food",
    image:
        "https://media.istockphoto.com/id/1136814342/photo/delicious-spaghetti-served-on-a-black-plate.jpg?s=1024x1024&w=is&k=20&c=Qy5lK3-pH46IiWtWLtv8PMH1PMk52OjCMvSgmkYKfdQ=",
    price: 20.0,
    time: "40 - 50 min",
    rate: 5.0,
  ),
  FoodModel(
    title: "Pasta",
    des: "This is pasta food",
    image:
        "https://media.istockphoto.com/id/1189709277/photo/pasta-penne-with-roasted-tomato-sauce-mozzarella-cheese-grey-stone-background-top-view.jpg?s=1024x1024&w=is&k=20&c=-cx2OEvdsCqs2TPK_EttPr7QZoTmeNww-Wa2njBeCR0=",
    price: 25.0,
    time: "50 - 60 min",
    rate: 4.0,
  ),
  FoodModel(
    title: "Salad",
    des: "This is salad food",
    image:
        "https://media.istockphoto.com/id/1322427478/photo/platter-with-salade-nicoise-close-up.jpg?s=1024x1024&w=is&k=20&c=42xIETf_5q1m7QqmzZxaKMv2PUXTg7VWm6IuGRBG0VY=",
    price: 30.0,
    time: "60 - 70 min",
    rate: 2.5,
  ),
];
