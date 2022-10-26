class CategoryModel {
  String categoria;
  String cliente;
  String colores;
  String descripcion;
  String disponible;
  String estado;
  String fechaCreacion;
  String id;
  String nombre;
  String precio;
  String tallas;
  String video;
  String descripcionPromo;
  String idPromocion;
  String valorPromo;
  String idProductoPromo;
  String fechaPromo;
  String estadoPromo;
  String likes;
  String megusta;
  String galeria;
  String imagen;

  CategoryModel({
    required this.categoria,
    required this.cliente,
    required this.colores,
    required this.descripcion,
    required this.disponible,
    required this.estado,
    required this.fechaCreacion,
    required this.id,
    required this.nombre,
    required this.precio,
    required this.tallas,
    required this.video,
    required this.descripcionPromo,
    required this.idPromocion,
    required this.valorPromo,
    required this.idProductoPromo,
    required this.fechaPromo,
    required this.estadoPromo,
    required this.likes,
    required this.megusta,
    required this.galeria,
    required this.imagen,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> parsedJson) {
    return CategoryModel(
      categoria: parsedJson["categoria"] ?? "",
      cliente: parsedJson["cliente"] ?? "",
      colores: parsedJson["colores"] ?? "",
      descripcion: parsedJson["descripcion"] ?? "",
      disponible: parsedJson["disponible"] ?? "",
      estado: parsedJson["estado"] ?? "",
      fechaCreacion: parsedJson['fecha_creacion'] ?? "",
      id: parsedJson["id"] ?? "",
      nombre: parsedJson['nombre'] ?? "",
      precio: parsedJson['precio'] ?? "",
      tallas: parsedJson['tallas'] ?? "",
      video: parsedJson['video'] ?? "",
      descripcionPromo: parsedJson['descripcion_promo'] ?? "",
      idPromocion: parsedJson['id_promocion'] ?? "",
      valorPromo: parsedJson['valor_promo'] ?? "",
      idProductoPromo: parsedJson['id_producto_promo'] ?? "",
      fechaPromo: parsedJson['fecha_promo'] ?? "",
      estadoPromo: parsedJson['estado_promo'] ?? "",
      likes: parsedJson['likes'] ?? "",
      megusta: parsedJson['megusta'] ?? "",
      galeria: parsedJson['galeria'] ?? "",
      imagen: parsedJson['imagen'] ?? "",
    );
  }
  // String get getCategoria => categoria;
  // String get cliente => cliente!;
  // String get colores => colores!;
  // String get descripcion => descripcion!;
  // String get disponible => disponible!;
  // String get estado => estado!;
  // String get fechaCreacion => fechaCreacion!;
  // String get id => id!;
  // String get nombre => nombre!;
  // String get precio => precio!;
  // String get tallas => tallas!;
  // String get video => video!;
  // String get descripcionPromo => descripcionPromo!;
  // String get idPromocion => idPromocion!;
  // String get valorPromo => valorPromo!;
  // String get idProductoPromo => idProductoPromo!;
  // String get fechaPromo => fechaPromo!;
  // String get estadoPromo => estadoPromo!;
  // String get likes => likes!;
  // String get megusta => megusta!;
  // String get galeria => galeria!;
}
