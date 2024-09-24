// ignore_for_file: empty_constructor_bodies

import 'package:ecommerce_app/utils/constants/image_strings.dart';

import '../features/shop/models/category_model.dart';

class TDummyData {
  /// --- Banners
  // static final List<BannerModels> banners = [
  //   BannerModels(
  //       imageUrl: HImages.banner1, targetScreen: HRoutes.order, active: false),
  //   BannerModels(
  //       imageUrl: HImages.banner2, targetScreen: HRoutes.cart, active: true),
  //   BannerModels(
  //       imageUrl: HImages.banner3,
  //       targetScreen: HRoutes.favourites,
  //       active: true),
  //   BannerModels(
  //       imageUrl: HImages.banner4, targetScreen: HRoutes.search, active: true),
  //   BannerModels(
  //       imageUrl: HImages.banner5,
  //       targetScreen: HRoutes.settings,
  //       active: true),
  //   BannerModels(
  //       imageUrl: HImages.banner6,
  //       targetScreen: HRoutes.userAddress,
  //       active: true),
  //   BannerModels(
  //       imageUrl: HImages.banner7, targetScreen: HRoutes.order, active: false),
  //   BannerModels(
  //       imageUrl: HImages.banner8,
  //       targetScreen: HRoutes.checkout,
  //       active: false),
  // ];

  /// --- User
  // static final UserModel user = UserModel(
  //   firstName: 'Harshit',
  //   lastName: 'khandelwal',
  //   email: 'khandelwalharshit431@gmail.com',
  //   phoneNumber: '1234567890',
  //   profilePicture: HImages.user,
  //   addresses: [
  //     AdressModel(
  //       id: '1',
  //       name: 'Home',
  //       phoneNumber: '+91 1234567890',
  //       street: '123, Main Street',
  //       city: 'Pune',
  //       state: 'Maharashtra',
  //       country: 'India',
  //       pincode: '411001',
  //       isDefault: true,
  //     ),
  //     AdressModel(
  //       id: '2',
  //       name: 'Work',
  //       phoneNumber: '+91 1234567890',
  //       street: '123, Main Street',
  //       city: 'Pune',
  //       state: 'Maharashtra',
  //       country: 'India',
  //       pincode: '411001',
  //       isDefault: false,
  //     ),
  //   ],
  // );

  /// --- Cart
  // static final CartModel cart = CartModel(
  //   cartId: '001',
  //   items: [
  //     CartItemModel(
  //       productId: '001',
  //       variationId: '1,
  //       quantity: 2,
  //       title: products[0].title,
  //       image: products[0].thumbnail,
  //       brandName: products[0].brand!.name,
  //       price: products[0].productVariations[0].price,
  //       selectedVariation: products[0].productVariations![0].attributeValues,
  //      ),
  //     CartItemModel(
  //       productId: '002',
  //       variationId: '1',
  //       quantity: 1,
  //       title: products[1].title,
  //       image: products[1].thumbnail,
  //       brandName: products[1].brand!.name,
  //       price: products[1].productVariations[0].price,
  //       selectedVariation: products[1].productVariations![0].attributeValues,
  //     ),
  //   ],
  // );

  /// -- Order
  // static final List<OrderModel> orders = [
  //   OrderModel(
  //     id: 'HK0012',
  //     status: OrderStatus.processing,
  //     items: cart.items,
  //     totalAmount: 265,
  //     orderDate: DateTime(2024, 12, 12),
  //     deliveryDate: DateTime(2024, 12, 15),
  //    ),
  //   OrderModel(
  //     id: 'HK0013',
  //     status: OrderStatus.delivered,
  //     items: cart.items,
  //     totalAmount: 265,
  //     orderDate: DateTime(2024, 12, 12),
  //     deliveryDate: DateTime(2024, 12, 15),
  //   ),
  // ];

  /// -- Categories
  static final List<CategoryModel> categories = [
    CategoryModel(
      id: '1',
      image: HImages.sportIcon,
      name: 'Sports',
      isFeatured: true,
    ),
    CategoryModel(
      id: '2',
      image: HImages.electronicsIcon,
      name: 'Electronics',
      isFeatured: true,
    ),
    CategoryModel(
      id: '3',
      image: HImages.clothIcon,
      name: 'Clothes',
      isFeatured: true,
    ),
    CategoryModel(
      id: '4',
      image: HImages.animalIcon,
      name: 'Animals',
      isFeatured: true,
    ),
    CategoryModel(
      id: '5',
      image: HImages.furnitureIcon,
      name: 'Furniture',
      isFeatured: true,
    ),
    CategoryModel(
      id: '6',
      image: HImages.shoeIcon,
      name: 'Shoes',
      isFeatured: true,
    ),
    CategoryModel(
      id: '7',
      image: HImages.cosmeticsIcon,
      name: 'Cosmetics',
      isFeatured: true,
    ),
    CategoryModel(
      id: '8',
      image: HImages.jeweleryIcon,
      name: 'Jewelery',
      isFeatured: true,
    ),

    /// Sub Categories
    // Sports
    CategoryModel(
      id: '9',
      parentId: '1',
      isFeatured: false,
      name: 'Sport Shoes',
      image: HImages.sportIcon,
    ),
    CategoryModel(
      id: '10',
      parentId: '1',
      isFeatured: false,
      name: 'Track suits',
      image: HImages.sportIcon,
    ),
    CategoryModel(
      id: '11',
      parentId: '1',
      isFeatured: false,
      name: 'Sports Equipments',
      image: HImages.sportIcon,
    ),
    // Electronics
    CategoryModel(
      id: '12',
      parentId: '2',
      isFeatured: false,
      name: 'Laptops',
      image: HImages.electronicsIcon,
    ),
    CategoryModel(
      id: '13',
      parentId: '2',
      isFeatured: false,
      name: 'Mobiles',
      image: HImages.electronicsIcon,
    ),

    // Clothes
    CategoryModel(
      id: '14',
      parentId: '3',
      isFeatured: false,
      name: 'Shirts',
      image: HImages.clothIcon,
    ),
    // Furniture
    CategoryModel(
      id: '15',
      parentId: '5',
      isFeatured: false,
      name: 'Bedroom Furniture',
      image: HImages.furnitureIcon,
    ),
    CategoryModel(
      id: '16',
      parentId: '5',
      isFeatured: false,
      name: 'Kitchen Furniture',
      image: HImages.furnitureIcon,
    ),
    CategoryModel(
      id: '17',
      parentId: '5',
      isFeatured: false,
      name: 'Office Furniture',
      image: HImages.furnitureIcon,
    ),
  ];

  /// -- List of All Brands
  // static final List<BrandModel> brands = [
  // BrandModel( id: '1' , image : HImages.nikeLogo , name: 'Nike', productCunt:265 , isFeatured:true),
  // BrandModel( id: '2' , image : HImages.adidasLogo , name: 'Adidas', productCunt:95 , isFeatured:true),
  // BrandModel( id: '8' , image : HImages.kenwoodLogo , name: 'Kenwood', productCunt:36 , isFeatured:false),
  // BrandModel( id: '9' , image : HImages.ikeaLogo , name: 'IKEA', productCunt:36 , isFeatured:false),
  // BrandModel( id: '5' , image : HImages.appleLogo , name: 'Apple', productCunt:16 , isFeatured:true),
  // BrandModel( id: '10' , image : HImages.acerLogo , name: 'Acer', productCunt:36 , isFeatured:false),
  // BrandModel( id: '3' , image : HImages.jordanLogo , name: 'Jordan', productCunt:36 , isFeatured:true),
  // BrandModel( id: '4' , image : HImages.pumaLogo , name: 'Puma', productCunt:65 , isFeatured:true),
  // BrandModel( id: '6' , image : HImages.zaraLogo , name: 'ZARA', productCunt:36 , isFeatured:true),
  // BrandModel( id: '7' , image : HImages.electronicsIcon , name: 'Samsung', productCunt:36 , isFeatured:false),

  /// -- List of All Brand Categories
  // static final List<BrandCategoryModel> brandCategories = [
  //   BrandCategoryModel(brandId : '1', categoryId: '1'),
  //   BrandCategoryModel(brandId : '1', categoryId: '8'),
  //   BrandCategoryModel(brandId : '1', categoryId: '9'),
  //   BrandCategoryModel(brandId : '1', categoryId: '10'),
  //   BrandCategoryModel(brandId : '2', categoryId: '1'),
  //   BrandCategoryModel(brandId : '2', categoryId: '8'),
  //   BrandCategoryModel(brandId : '2', categoryId: '9'),
  //   BrandCategoryModel(brandId : '2', categoryId: '10'),
  //   BrandCategoryModel(brandId : '3', categoryId: '1'),
  //   BrandCategoryModel(brandId : '3', categoryId: '8'),
  //   BrandCategoryModel(brandId : '3', categoryId: '9'),
  //   BrandCategoryModel(brandId : '3', categoryId: '10'),
  //   BrandCategoryModel(brandId : '4', categoryId: '1'),
  //   BrandCategoryModel(brandId : '4', categoryId: '8'),
  //   BrandCategoryModel(brandId : '4', categoryId: '9'),
  //   BrandCategoryModel(brandId : '4', categoryId: '10'),
  //   BrandCategoryModel(brandId : '5', categoryId: '15'),
  //   BrandCategoryModel(brandId : '5', categoryId: '2'),
  //   BrandCategoryModel(brandId : '6', categoryId: '3'),
  //   BrandCategoryModel(brandId : '6', categoryId: '16'),
  //   BrandCategoryModel(brandId : '7', categoryId: '2'),
  //   BrandCategoryModel(brandId : '8', categoryId: '5'),
  //   BrandCategoryModel(brandId : '8', categoryId: '11'),
  //   BrandCategoryModel(brandId : '8', categoryId: '12'),
  //   BrandCategoryModel(brandId : '8', categoryId: '13'),
  //   BrandCategoryModel(brandId : '9', categoryId: '5'),
  //   BrandCategoryModel(brandId : '9', categoryId: '11'),
  //   BrandCategoryModel(brandId : '9', categoryId: '12'),
  //   BrandCategoryModel(brandId : '9', categoryId: '13'),
  //   BrandCategoryModel(brandId : '10', categoryId: '2'),
  //   BrandCategoryModel(brandId : '10', categoryId: '14'),
  // ];

  /// -- List of All Products Categories
  // static final List<ProductCategoryModel> productCategories = [
  //   ProductCategoryModel(productId : '001', categoryId: '1'),
  //   ProductCategoryModel(productId : '001', categoryId: '8'),
  //   ProductCategoryModel(productId : '004', categoryId: '3'),
  //   ProductCategoryModel(productId : '002', categoryId: '3'),
  //   ProductCategoryModel(productId : '002', categoryId: '16'),
  //   ProductCategoryModel(productId : '003', categoryId: '3'),
  //   ProductCategoryModel(productId : '005', categoryId: '1'),
  //   ProductCategoryModel(productId : '005', categoryId: '8'),
  //   ProductCategoryModel(productId : '040', categoryId: '2'),
  //   ProductCategoryModel(productId : '040', categoryId: '15'),
  //   ProductCategoryModel(productId : '006', categoryId: '2'),
  //   ProductCategoryModel(productId : '007', categoryId: '4'),
  //   ProductCategoryModel(productId : '008', categoryId: '2'),
  //   ProductCategoryModel(productId : '009', categoryId: '1'),
  //   ProductCategoryModel(productId : '009', categoryId: '8'),
  //   ProductCategoryModel(productId : '010', categoryId: '1'),
  //   ProductCategoryModel(productId : '010', categoryId: '8'),
  //   ProductCategoryModel(productId : '011', categoryId: '1'),
  //   ProductCategoryModel(productId : '011', categoryId: '8'),
  //   ProductCategoryModel(productId : '012', categoryId: '1'),
  //   ProductCategoryModel(productId : '012', categoryId: '8'),
  //   ProductCategoryModel(productId : '013', categoryId: '1'),
  //   ProductCategoryModel(productId : '013', categoryId: '8'),

  //   ProductCategoryModel(productId : '014', categoryId: '1'),
  //   ProductCategoryModel(productId : '014', categoryId: '9'),
  //   ProductCategoryModel(productId : '015', categoryId: '1'),
  //   ProductCategoryModel(productId : '015', categoryId: '9'),
  //   ProductCategoryModel(productId : '016', categoryId: '1'),
  //   ProductCategoryModel(productId : '016', categoryId: '9'),
  //   ProductCategoryModel(productId : '017', categoryId: '1'),
  //   ProductCategoryModel(productId : '017', categoryId: '9'),

  //   ProductCategoryModel(productId : '018', categoryId: '1'),
  //   ProductCategoryModel(productId : '018', categoryId: '10'),
  //   ProductCategoryModel(productId : '019', categoryId: '1'),
  //   ProductCategoryModel(productId : '019', categoryId: '10'),
  //   ProductCategoryModel(productId : '020', categoryId: '1'),
  //   ProductCategoryModel(productId : '020', categoryId: '10'),
  //   ProductCategoryModel(productId : '021', categoryId: '1'),
  //   ProductCategoryModel(productId : '021', categoryId: '10'),

  //   ProductCategoryModel(productId : '022', categoryId: '5'),
  //   ProductCategoryModel(productId : '022', categoryId: '11'),
  //   ProductCategoryModel(productId : '023', categoryId: '5'),
  //   ProductCategoryModel(productId : '023', categoryId: '11'),
  //   ProductCategoryModel(productId : '024', categoryId: '5'),
  //   ProductCategoryModel(productId : '024', categoryId: '11'),
  //   ProductCategoryModel(productId : '025', categoryId: '5'),
  //   ProductCategoryModel(productId : '025', categoryId: '11'),

  //   ProductCategoryModel(productId : '025', categoryId: '5'),
  //   ProductCategoryModel(productId : '025', categoryId: '12'),
  //   ProductCategoryModel(productId : '026', categoryId: '5'),
  //   ProductCategoryModel(productId : '026', categoryId: '12'),
  //   ProductCategoryModel(productId : '027', categoryId: '5'),
  //   ProductCategoryModel(productId : '027', categoryId: '12'),
  //   ProductCategoryModel(productId : '028', categoryId: '5'),
  //   ProductCategoryModel(productId : '028', categoryId: '12'),

  //   ProductCategoryModel(productId : '029', categoryId: '5'),
  //   ProductCategoryModel(productId : '029', categoryId: '13'),
  //   ProductCategoryModel(productId : '030', categoryId: '5'),
  //   ProductCategoryModel(productId : '030', categoryId: '13'),
  //   ProductCategoryModel(productId : '031', categoryId: '5'),
  //   ProductCategoryModel(productId : '031', categoryId: '13'),
  //   ProductCategoryModel(productId : '032', categoryId: '5'),
  //   ProductCategoryModel(productId : '032', categoryId: '13'),

  //   ProductCategoryModel(productId : '033', categoryId: '2'),
  //   ProductCategoryModel(productId : '033', categoryId: '14'),
  //   ProductCategoryModel(productId : '034', categoryId: '2'),
  //   ProductCategoryModel(productId : '034', categoryId: '14'),
  //   ProductCategoryModel(productId : '035', categoryId: '2'),
  //   ProductCategoryModel(productId : '035', categoryId: '14'),
  //   ProductCategoryModel(productId : '036', categoryId: '2'),
  //   ProductCategoryModel(productId : '036', categoryId: '14'),
  //   ProductCategoryModel(productId : '037', categoryId: '2'),
  //   ProductCategoryModel(productId : '037', categoryId: '15'),
  //   ProductCategoryModel(productId : '038', categoryId: '2'),
  //   ProductCategoryModel(productId : '038', categoryId: '15'),
  //   ProductCategoryModel(productId : '039', categoryId: '2'),
  //   ProductCategoryModel(productId : '039', categoryId: '15'),
  //  ];

  /// --- List of All Product
  // static final List<ProductModel> products=[
  //  ProductModel(
  //    id: '001',
  //    title: 'Green Nike sports Shoe',
  //    stock: 15,
  //    price:135,
  //    isFeatured: true,
  //    thumbnail: HImages.productImage1,
  //    description: 'Green Nike sports Shoe',
  //    brand: brandModel(id: '1', name: 'Nike', image: HImages.nikeLogo, productCunt: 265, isFeatured: true),
  //    images: [HImages.productImage1, HImages.productImage23, HImages.productImage21, HImages.productImage9],
  //    salePrice: 30,
  //    sku: 'ABR4658',
  //    categoryId: '1',
  //    productAttributes: [
  //      ProductAttributeModel( name: 'Color', values: ['Green', 'Black', 'Red',]),
  //      ProductAttributeModel( name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
  //    ],
  //    productVariations: [
  //      ProductVariationModel( id: '1', price: 135, salePrice:122.6, stock: 34, image: HImages.productImage1, description: 'This is Product Discription for Green Nike sports Shoe.', attributeValues: {'Color': 'Green', 'Size': 'EU 30'}),
  //      ProductVariationModel( id: '2', price: 132, stock: 15, image: HImages.productImage23, attributeValues: {'Color': 'Black', 'Size': 'EU 32'}),
  //      ProductVariationModel( id: '3', price: 234, stock: 0, image: HImages.productImage23, attributeValues: {'Color': 'Black', 'Size': 'EU 34'}),
  //      ProductVariationModel( id: '4', price: 232, stock: 222, image: HImages.productImage1, attributeValues: {'Color': 'Green', 'Size': 'EU 32'}),
  //      ProductVariationModel( id: '5', price: 334, stock: 0, image: HImages.productImage21, attributeValues: {'Color': 'Red', 'Size': 'EU 34'}),
  //      ProductVariationModel( id: '6', price: 332, stock: 11, image: HImages.productImage21, attributeValues: {'Color': 'Red', 'Size': 'EU 32'}),
  //    ],
  //    productType: 'ProductType.single',
  //  ),
  //  ProductModel(
  //    id: '002',
  //    title: 'Blue T-shirt for all ages',
  //    stock: 15,
  //    price: 35,
  //    isFeatured: true,
  //    thumbnail: HImages.productImage69,
  //    description: 'This is Product Discription for Blue Nike Sleeve less vest. There are more things you can add here.',
  //  brand: brandModel(id: '6', image: HImages.zaraLogo, name: 'ZARA'),
  //    images: [HImages.productImage68, HImages.productImage69, HImages.productImage1],
  //    salePrice: 30,
  //    sku: 'ABR4568',
  //    categoryId: '16',
  //    productAttributes: [
  //      ProductAttributeModel( name: 'Color', values: ['Blue', 'Black', 'Red',]),
  //      ProductAttributeModel( name: 'Size', values: ['EU 32']),
  //    ],
  //    productType: 'ProductType.single',
  //  ),
  //  ProductModel(
  //    id: '003',
  //    title: 'Leather brown Jacket',
  //    stock: 15,
  //    price: 38000,
  //    isFeatured: false,
  //    thumbnail: HImages.productImage64,
  //    description: 'This is Product Discription for Leather brown Jacket. There are more things you can add here.',
  //   brand: brandModel(id: '6', image: HImages.zaraLogo, name: 'ZARA'),
  //    images: [HImages.productImage64, HImages.productImage65, HImages.productImage66, HImages.productImage67],
  //    salePrice: 30,
  //    sku: 'ABR4568',
  //    categoryId: '16',
  //    productAttributes: [
  //      ProductAttributeModel( name: 'Color', values: ['Brown', 'Black', 'Red',]),
  //      ProductAttributeModel( name: 'Size', values: ['EU 32', 'EU 34']),
  //    ],
  //    productType: 'ProductType.single',
  //  ),
  //  ProductModel(
  //    id: '004',
  //    title: '4 Color collar t-shirt dry fit',
  //    stock: 15,
  //    price: 135,
  //    isFeatured: false,
  //    thumbnail: HImages.productImage60,
  //    description: 'This is Product Discription for 4 Color collar t-shirt dry fit. There are more things you can add here.',
  //    brand: brandModel(id: '6', image: HImages.zaraLogo, name: 'ZARA'),
  //    images: [HImages.productImage60, HImages.productImage61, HImages.productImage62, HImages.productImage63],
  //    salePrice: 30,
  //    sku: 'ABR4568',
  //    categoryId: '16',
  //    productAttributes: [
  //      ProductAttributeModel( name: 'Color', values: ['Green', 'Yellow', 'Red','Blue']),
  //      ProductAttributeModel( name: 'Size', values: ['EU 30','EU 32', 'EU 34']),
  //    ],
  //    productVariations: [
  //      ProductVariationModel( id: '1', price: 135, salePrice:122.6, stock: 34, image: HImages.productImage60, description: 'This is Product Discription for 4 Color collar t-shirt dry fit.', attributeValues: {'Color': 'Red', 'Size': 'EU 34'}),
  //      ProductVariationModel( id: '2', price: 132, stock: 15, image: HImages.productImage01, attributeValues: {'Color': 'Red', 'Size': 'EU 32'}),
  //      ProductVariationModel( id: '3', price: 234, stock: 0, image: HImages.productImage61, attributeValues: {'Color': 'Yellow', 'Size': 'EU 30'}),
  //      ProductVariationModel( id: '4', price: 232, stock: 222, image: HImages.productImage61, attributeValues: {'Color': 'Yellow', 'Size': 'EU 32'}),
  //      ProductVariationModel( id: '5', price: 334, stock: 0, image: HImages.productImage62, attributeValues: {'Color': 'Green', 'Size': 'EU 34'}),
  //      ProductVariationModel( id: '6', price: 332, stock: 11, image: HImages.productImage62, attributeValues: {'Color': 'Green', 'Size': 'EU 32'}),
  //      ProductVariationModel( id: '7', price: 334, stock: 0, image: HImages.productImage63, attributeValues: {'Color': 'Blue', 'Size': 'EU 34'}),
  //      ProductVariationModel( id: '8', price: 332, stock: 11, image: HImages.productImage63, attributeValues: {'Color': 'Blue', 'Size': 'EU 32'}),
  //   ],
  //   productType: 'ProductType.single',
  //  ),
  /// Products after banner
  // ProductModel(
  //   id: '005',
  //   title: 'Nike Air Jordan Shoes',
  //   stock: 15,  
  //   price: 35,
  //   isFeatured: false,
  //   thumbnail: HImages.productImage10,
  //   description: 'This is Product Discription for Nike Air Jordan Shoes. There are more things you can add here.',
  //   brand: brandModel(id: '1', image: HImages.nikeLogo, name: 'Nike', productCunt: 265, isFeatured: true),
  //   images: [HImages.productImage7, HImages.productImage8, HImages.productImage9, HImages.productImage10],
  //   salePrice: 30,
  //   sku: 'ABR4568',
  //   categoryId: '8',
  //   productAttributes: [
  //     ProductAttributeModel( name: 'Color', values: ['Orange', 'Black', 'Brown']),
  //     ProductAttributeModel( name: 'Size', values: ['EU 32' , 'EU 32' 'EU 34']),
  //   ],
  //   productVariations: [
  //     ProductVariationModel( id: '1', price: 135, salePrice:122.6, stock: 34, image: HImages.productImage8, description: 'This is Product Discription for Nike Air Jordan Shoes.', attributeValues: {'Color': 'Orange', 'Size': 'EU 30'}),
  //      ProductVariationModel( id: '2', price: 132, stock: 15, image: HImages.productImage7, attributeValues: {'Color': 'Black', 'Size': 'EU 32'}),
  //      ProductVariationModel( id: '3', price: 234, stock: 0, image: HImages.productImage9, attributeValues: {'Color': 'Brown', 'Size': 'EU 34'}),
  //      ProductVariationModel( id: '4', price: 232, stock: 222, image: HImages.productImage7, attributeValues: {'Color': 'Orange', 'Size': 'EU 32'}),
  //      ProductVariationModel( id: '5', price: 334, stock: 0, image: HImages.productImage8, attributeValues: {'Color': 'Black', 'Size': 'EU 34'}),
  //      ProductVariationModel( id: '6', price: 332, stock: 11, image: HImages.productImage9, attributeValues: {'Color': 'Brown', 'Size': 'EU 32'}),
  //   ],
  //  productType: 'ProductType.variable',
  // ),
  // ProductModel(
  //   id: '006',
  //   title: 'SAMSUMG Galaxy S9 (Pink, 64GB) (4 GB RAM)',
  //   stock: 15,
  //   price: 135,
  //   isFeatured: false,
  //   thumbnail: HImages.productImage11,
  //   description: 'This is Product Discription for SAMSUMG Galaxy S9 (Pink, 64GB) (4 GB RAM). There are more things you can add here.',
  //   brand: brandModel(id: '7', image: HImages.electronicsIcon, name: 'Samsung'),
  //   images: [HImages.productImage11, HImages.productImage12, HImages.productImage13],
  //   salePrice: 30,
  //   sku: 'ABR4568',
  //   categoryId: '2',
  //   productAttributes: [
  //     ProductAttributeModel( name: 'Color', values: ['Pink', 'Black', 'Red']),
  //     ProductAttributeModel( name: 'Size', values: ['EU 32', 'EU 34']),
  //   ],
  //   productType: 'ProductType.single',
  // ),
  //
  // ProductModel(
  //   id: '007',
  //   title: 'TOMI Dog Food',
  //   stock: 15,
  //   price: 135,
  //   isFeatured: false,
  //   thumbnail: HImages.productImage18,
  //   description: 'This is Product Discription for TOMI Dog Food. There are more things you can add here.',
  //   brand: brandModel(id: '9', image: HImages.ikeaLogo, name: 'IKEA'),
  //   salePrice: 30,
  //   sku: 'ABR4568',
  //   categoryId: '4',
  //   productAttributes: [
  //     ProductAttributeModel( name: 'Color', values: ['Green', 'Black', 'Red']),
  //     ProductAttributeModel( name: 'Size', values: ['EU 32', 'EU 34']),
  //   ],
  //   productType: 'ProductType.single',
  // ),

  // ProductModel(
  
  //
  //
  // ];
}
