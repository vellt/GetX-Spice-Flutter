import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LanguageController extends GetxController {
  bool isHungarian = true;

  //todo: a loating action button tooltipek hozzáadása

  //language screen
  String get languageHeader => (isHungarian) ? "Nyelv beállítása" : "Languages";
  String get languageDescription => (isHungarian)
      ? "Válassza ki a használni kívánt nyelvet az alábbi listából."
      : "Select the language you want to use from the list below.";
  String get languageButton1 => (isHungarian) ? "Magyar" : "Hungarian";
  String get languageButton2 => (isHungarian) ? "Angol" : "English";

  //home screen
  String get homeHeader1 => (isHungarian) ? "Gyors elérés" : "Quick access";
  String get homeDescription1 => (isHungarian)
      ? "Lehetővé teszi a termék gyors elérést. A lista módosításához kattints a szerkesztés gombra."
      : "Allows quick access to the product. To edit the list, click on the edit button.";
  String get homeButton1 => (isHungarian) ? "szerkesztés" : "edit";
  String get homeHeader2 =>
      (isHungarian) ? "További lehetőségek" : "Other options";
  String get homeDescription2 => (isHungarian)
      ? "Itt találja meg az applikáció fő menüpontjait."
      : "Here you can find the main menu options of the app.";
  String get homeButton2 =>
      (isHungarian) ? "Fűszer kimérése" : "Spice weighing";
  String get homeButton3 => (isHungarian) ? "Termékek" : "Products";
  String get homeButton4 =>
      (isHungarian) ? "Adatok kezelése" : "Data management";
  String get homeButton5 => (isHungarian) ? "Nyelv beállítása" : "Languages";
  String get homeToolTip1 => (isHungarian) ? "GitHub/vellt" : "GitHub/vellt";
  String get homeToolTip2 => (isHungarian) ? "témaváltás" : "change theme";

  //quick access screen
  String get quickAccessHeader1 =>
      (isHungarian) ? "Gyors elérés" : "Quick access";
  String get quickAccessDescription1 => (isHungarian)
      ? "Kattints a megjelenő termékekre, hogy felvedd a gyors elérési listába, vagy levedd onnan."
      : "Click on the products that appear to add them to or remove them from the quick access list.";

  //product view screen
  String get productViewHeader1 => (isHungarian) ? "Termékek" : "Products";
  String get productViewDescription1 => (isHungarian)
      ? "Itt találod a felvett termékeket. Új hozzáadásához kattint az alábbi gombra."
      : "Here you can find the products you have added. If you want to add a new one, click on the button below.";
  String get productViewButton1 =>
      (isHungarian) ? "Termék hozzáadása" : "Add product";
  String get productViewHeader2 =>
      (isHungarian) ? "Termék szerkesztése" : "Edit product";
  String get productViewDescription2 => (isHungarian)
      ? "Katints az adott termékre, annak a szerkesztéséhez vagy törléséhez"
      : "Click on a product to edit or delete it";

  //product add screen
  String get productAddHeader1 =>
      (isHungarian) ? "Termék hozzáadása" : "Add product";
  String get productAddHeader2 => (isHungarian) ? "Fűszerek" : "Spices";
  String get productAddDescription1 => (isHungarian)
      ? "Adjon hozzá fűszert a termékhez az alábbi gombra kattintva."
      : "Add spices to the product by clicking on the button below.";
  String get productAddButton1 =>
      (isHungarian) ? "Fűszer hozzáaadása" : "Add spice";
  String get productAddToolTip1 => (isHungarian) ? "mentés" : "save";

  //product edit screen
  String get productEditHeader1 =>
      (isHungarian) ? "Termék szerkesztése" : "Edit product";
  String get productEditHeader2 => (isHungarian) ? "Fűszerek" : "Spices";
  String get productEditDescription1 => (isHungarian)
      ? "Adjon hozzá fűszert a termékhez az alábbi gombra kattintva."
      : "Add spices to the product by clicking on the button below.";
  String get productEditButton1 =>
      (isHungarian) ? "Fűszer hozzáaadása" : "Add spice";
  String get productEditToolTip1 =>
      (isHungarian) ? "termék törlése" : "delete product";
  String get productEditToolTip2 =>
      (isHungarian) ? "módosítás" : "save changes";

  //spice add screen
  String get spiceAddHeader1 =>
      (isHungarian) ? "Fűszer hozzáadása" : "Add spice";
  String get spiceAddToolTip1 => (isHungarian) ? "mentés" : "save";

  //spice edit screen
  String get spiceEditHeader1 =>
      (isHungarian) ? "fűszer szerkesztése" : "edit spice";
  String get spiceEditToolTip1 =>
      (isHungarian) ? "fűszer törlése" : "felete spice";
  String get spiceEditToolTip2 => (isHungarian) ? "módosítás" : "save changes";

  //input
  String get inputText => (isHungarian) ? "Megnevezés" : "Name";
  String get inputNumber => (isHungarian) ? "Súly" : "Quantity";

  //data
  String get dataHeader1 =>
      (isHungarian) ? "Adatok kezelése" : "Data management";
  String get dataHeader2 =>
      (isHungarian) ? "Mentés visszaállítása" : "Restore backup";
  String get dataDescription1 => (isHungarian)
      ? "Régebbi adatok visszaállítása json fájlból történik, melyet az alábbi gombra kattintva lesz lehetőség kiválasztani a könyvtárból."
      : "Older data is restored from a json file, which can be selected from the directory by clicking on the button below.";
  String get dataButton1 =>
      (isHungarian) ? "Tallózás a könyvtárból" : "Browse from the library";
  String get dataHeader3 =>
      (isHungarian) ? "Biztonsági mentés készítése" : "Make backup";
  String get dataDescription2 => (isHungarian)
      ? "Az adatok mentéséhez az alábbi gombra kattintva válik lehetőség kiválasztani a célmappát."
      : "To save the data, click the button below to select the destination folder.";
  String get dataButton2 =>
      (isHungarian) ? "Mentés az eszközre" : "Save to device";
  String get dataHeader4 => (isHungarian) ? "Adatok törlése" : "Delete data";
  String get dataDescription3 => (isHungarian)
      ? "Az alábbi gombra kattintva az adatok véglegesen törlődni fognak a készülékről."
      : "Clicking the button below will permanently delete the data from your device.";
  String get dataButton3 => (isHungarian) ? "Adatok törlése" : "Delete data";

  //no
  String get noProduct => (isHungarian) ? "Nincs termék" : "No product";
  String get noSpice => (isHungarian) ? "Nincs fűszer" : "No spice";

  //other
  String get otherBack => (isHungarian) ? "vissza" : "back";

  final _box = GetStorage();

  changeLanguage({required bool isHungarian}) {
    this.isHungarian = isHungarian;
    _box.write('isHungarian', isHungarian);
    update();
  }

  @override
  void onInit() {
    super.onInit();
    isHungarian = _box.read('isHungarian') ?? false;
  }
}
