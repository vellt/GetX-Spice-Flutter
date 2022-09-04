import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LanguageController extends GetxController {
  bool isHungarian = true;

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
      ? "Lehetővé teszi a termékeknek a gyors elérését a főoldalon. A lista módosításához kattints a szerkesztés gombra."
      : "Allows quick access to products on the main page. To edit the list, click on the edit button.";
  String get homeButton1 => (isHungarian) ? "szerkesztés" : "edit";
  String get homeHeader2 =>
      (isHungarian) ? "További lehetőségek" : "Other options";
  String get homeDescription2 => (isHungarian)
      ? "Itt található az applikáció fő menüpontjai"
      : "Here are the main menus of the app.";
  String get homeButton2 =>
      (isHungarian) ? "Fűszer kimérése" : "Measure Spices";
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
      (isHungarian) ? "Fűszer szerkesztése" : "Edit spice";
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
      ? "Az alábbi gombra kattintva az adatok véglegesen törlődni fognak a készülékről. Az adatokról érdemes biztonségi mentést készíteni mielőtt törölné, hogy azt később vissza lehessen állítani."
      : "Clicking the button below will permanently delete the data from your device. You should make a backup of your data before you delete it so that you can restore it later.";
  String get dataButton3 => (isHungarian) ? "Adatok törlése" : "Delete data";

  //no
  String get noProduct => (isHungarian) ? "Nincs termék" : "No product";
  String get noSpice => (isHungarian) ? "Nincs fűszer" : "No spice";

  //other
  String get otherBack => (isHungarian) ? "vissza" : "back";

  //alert
  String get alertClose => (isHungarian) ? "Bezár" : "Close";
  String get alertError => (isHungarian) ? "Hiba" : "Error";
  String get alertProductNameEmpty => (isHungarian)
      ? "A termék megnevezése nem lehet üres."
      : "The name of product can't be empty.";
  String get alertProductQuantityEmpty => (isHungarian)
      ? "A termék mennyisége nem lehet üres."
      : "The quantity of product can't be empty.";
  String get alertProductQuantityNaN => (isHungarian)
      ? "A termék mennyisége csak számot tartalmazhat."
      : "The quantity of the product can only contain a number.";
  String get alertSpiceNameEmpty => (isHungarian)
      ? "A fűszer megnevezése nem lehet üres."
      : "The name of spice can't be empty.";
  String get alertSpiceQuantityEmpty => (isHungarian)
      ? "A fűszer mennyisége nem lehet üres."
      : "The quantity of spice can't be empty.";
  String get alertSpiceQuantityNaN => (isHungarian)
      ? "A fűszer mennyisége csak számot tartalmazhat."
      : "The quantity of the spice can only contain a number.";
  String get alertDelete => (isHungarian) ? "Adatok törlése" : "Delete Data";
  String get alertSpiceDeleteTitle =>
      (isHungarian) ? "Fűszer törlése" : "Delete Spice";
  String get alertProductDeleteTitle =>
      (isHungarian) ? "Termék törlése" : "Delete Product";
  String get alertYes => (isHungarian) ? "Igen" : "Confirm";
  String get alertNo => (isHungarian) ? "Nem" : "Chanel";
  String get alertProductDelete => (isHungarian)
      ? "Biztos törölni akarja ezt a terméket?"
      : "Are you sure you want to remove this product?";
  String get alertSpiceDelete => (isHungarian)
      ? "Biztos törölni akarja ezt a fűszert a termék fűszer listájából?"
      : "Are you sure you want to remove this spice from the spice list of the product?";
  String get alertDataDelete => (isHungarian)
      ? "Biztos törölni akarja adatait a készülékről?"
      : "Are you sure you want to delete your data from your device?";

  //snack bar
  String get snackBarDelete =>
      (isHungarian) ? 'Az adatok törlődtek.' : 'The data has been deleted.';
  String get snackBarBackup1 => (isHungarian)
      ? "Az adatok a következő mappába kerültek mentésre."
      : "The data is saved in the following folder.";
  String get snackBarBackup2 =>
      (isHungarian) ? "Nincs menthető adat." : "No data to save.";
  String get snackBarRestore =>
      (isHungarian) ? "Sikeresen helyreállítva." : 'Restored successfully.';

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
