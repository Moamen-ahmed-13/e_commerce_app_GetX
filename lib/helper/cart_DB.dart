import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/model/cart_product_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CartDbHelper {
  CartDbHelper._();

  static CartDbHelper db = CartDbHelper._();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database ??= await initDB();
    return _database!;
  }

  initDB() async {
    String path = join(await getDatabasesPath(), 'CartProduct.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
CREATE TABLE $tableProduct(
$columnId TEXT NOT NULL,
$columnName TEXT NOT NULL,
$columnPrice TEXT NOT NULL,
$columnImage TEXT NOT NULL,
$columnQuantity INTEGER NOT NULL
)
''');
      },
    );
  }

  Future<void> insertProduct(CartProductModel productModel) async {
    var dbProduct = await database;
    await dbProduct.insert(
      tableProduct,
      productModel.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<CartProductModel>> getAllProduct() async {
    var dbProduct = await database;
    List<Map<String, dynamic>> maps = await dbProduct.query(
      tableProduct,
      where: '$columnQuantity > 0',
    );
    return maps.isNotEmpty
        ? maps.map((product) => CartProductModel.fromJson(product)).toList()
        : [];
  }

  updateProduct(CartProductModel productModel) async {
    var dbProduct = await database;
   return await dbProduct.update(tableProduct, productModel.toJson(),
        where: '$columnId = ?', whereArgs: [productModel.id]);
        

  }

  Future<void> deleteProduct(int id) async {
    var dbProduct = await database;
    await dbProduct.delete(tableProduct, where: '$columnId = ?', whereArgs: [id]);
  }
}
