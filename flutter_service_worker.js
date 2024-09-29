'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "6409c770f374115220730d8e194dbcf1",
"assets/AssetManifest.bin.json": "4ebbbdd820648b43eeb0164c7e57bc57",
"assets/AssetManifest.json": "454e79d1d47877b9fdf5087893dc210f",
"assets/assets/fonts/Poppins-Bold.ttf": "08c20a487911694291bd8c5de41315ad",
"assets/assets/fonts/Poppins-Italic.ttf": "c1034239929f4651cc17d09ed3a28c69",
"assets/assets/fonts/Poppins-Light.ttf": "fcc40ae9a542d001971e53eaed948410",
"assets/assets/fonts/Poppins-Medium.ttf": "bf59c687bc6d3a70204d3944082c5cc0",
"assets/assets/fonts/Poppins-MediumItalic.ttf": "cf5ba39d9ac24652e25df8c291121506",
"assets/assets/fonts/Poppins-Regular.ttf": "093ee89be9ede30383f39a899c485a82",
"assets/assets/fonts/Poppins-SemiBold.ttf": "6f1520d107205975713ba09df778f93f",
"assets/assets/icons/brands/nike.png": "09160ccfb59f529bf6cdf86bcff0282d",
"assets/assets/icons/categories/icons8-bowling-64.png": "27b8ade208244c61a480b6a9cbe0fcfa",
"assets/assets/icons/categories/icons8-cosmetics-64.png": "91350d3fcc3d90819ffe88983c3043f3",
"assets/assets/icons/categories/icons8-dining-chair-64.png": "865ccdf081530ac9b25d1a9c003da8d2",
"assets/assets/icons/categories/icons8-dog-heart-64.png": "b95f05b8890b2a08d246f28a86ec0317",
"assets/assets/icons/categories/icons8-school-uniform-64.png": "71731bca60ec390b9b3d0d6054de1162",
"assets/assets/icons/categories/icons8-shoes-64.png": "7fa3c6c1d2c4f98e96a6b6ad3f48f9f3",
"assets/assets/icons/categories/icons8-smartphone-64.png": "02e78f9f0bd8515f9ab4154bacbd77fd",
"assets/assets/icons/categories/icons8-sparkling-diamond-64.png": "95242a50bd94777c2ed5d912038cf45f",
"assets/assets/icons/categories/icons8-tailors-dummy-64.png": "a4866e0356d01573df25c6954b57cb93",
"assets/assets/icons/categories/icons8-wooden-toy-car-50.png": "96e4a06369b3a1817ffc80c8583db072",
"assets/assets/icons/payment_methods/paypal.png": "1597d2e2a75ec5d8f9ea4fbc40ff7e3d",
"assets/assets/icons/payment_methods/successful_payment_icon.png": "c6ecac5e4a7b5ab35be124e482287cd4",
"assets/assets/images/animations/141594-animation-of-docer.json": "0447d6592aa7c62f7464b5a867a18bf7",
"assets/assets/images/animations/72462-check-register.json": "f025dd10b211685777be1fc8b9d43f37",
"assets/assets/images/animations/sammy-line-come-back-later.png": "bb489d0ad837808917ed0b3bd2c17d97",
"assets/assets/images/animations/sammy-line-man-receives-a-mail.png": "05ecfa9b154cb7fe1d4f4339119a3b45",
"assets/assets/images/animations/sammy-line-sale.png": "c8cf76d47496487772f231d41e3673ed",
"assets/assets/images/animations/sammy-line-success.png": "4aaf57cacb9b7514f345bd45cea880e1",
"assets/assets/images/animations/sammy-line-travel-backpack-with-passport-and-air-ticket.gif": "a691c26c3c08c432f68ce4b117dcb6a0",
"assets/assets/images/animations/sammy-line-workout.gif": "32c3916fc369a730a7aa7a6c24b9583e",
"assets/assets/images/content/user.png": "f9e447f2bebc53ca0294824e2db43c82",
"assets/assets/images/on_boarding_images/sammy-line-delivery.gif": "faf973c05c1858e0ddecb6d771d42e53",
"assets/assets/images/on_boarding_images/sammy-line-no-connection.gif": "58aedc14a78caa9edfccf3683a80a186",
"assets/assets/images/on_boarding_images/sammy-line-searching.gif": "deb343fe59f59566d98cd14119aedd61",
"assets/assets/images/on_boarding_images/sammy-line-shopping.gif": "3cdbc77e78f238419f5daddfc2c63117",
"assets/assets/images/products/nike-shoes.png": "7bd206fd5ea8a583f29774ba5056944c",
"assets/assets/images/products/product-1.png": "8bd5480d89513e42dad85960621a76e3",
"assets/assets/images/products/product-jacket.png": "3af047f07f1f2dec7021e2cf60eeebd3",
"assets/assets/images/products/promo-banner-1.png": "3782cfad0a8c18afe3315fa8c56f6071",
"assets/assets/images/products/promo-banner-2.png": "3fecbd4c54aef7fc52ae0897a5a0702f",
"assets/assets/images/products/promo-banner-3.png": "2d4ac1598b12eac6fb143a9feebf58c2",
"assets/assets/images/products/user_img.jpg": "dfcdd01b16056d60c5ad844d5c4f3566",
"assets/assets/images/reviews/review_profile_image_1.jpg": "ab0ff289e5c4032acafc1e8f78678cbc",
"assets/assets/images/reviews/review_profile_image_2.jpeg": "635fc8f7bdfed0d074af73747b606ba6",
"assets/assets/images/reviews/review_profile_image_3.jpeg": "361b3872e8ed0baab939a0213feaeb9d",
"assets/assets/logos/google-icon.png": "b95e5615716a3ae4b62f14a430bb1253",
"assets/assets/logos/logo_foreground.png": "5ed12a4002b56b0ffb1830f915e886d1",
"assets/assets/logos/style-hub-logo-black.png": "a20f7c63d108177b2fd4d843c9e9b045",
"assets/assets/logos/style-hub-logo-white.png": "d0ae922f0d67058f7b36319085da33de",
"assets/assets/logos/style-hub-splash-logo-black.png": "19740398999f936d7aec8f5afe26d4b3",
"assets/assets/logos/style-hub-splash-logo-white.png": "3a6dd999a10e305fede8d5752e7d32a0",
"assets/FontManifest.json": "d947bacefeabced61a7e48422f11efcf",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/NOTICES": "c06e842a6fb7fe3fe580b035b1baa5f4",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "b93248a553f9e8bc17f1065929d5934b",
"assets/packages/iconsax/lib/assets/fonts/iconsax.ttf": "071d77779414a409552e0584dcbfd03d",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "738255d00768497e86aa4ca510cce1e1",
"canvaskit/canvaskit.js.symbols": "74a84c23f5ada42fe063514c587968c6",
"canvaskit/canvaskit.wasm": "9251bb81ae8464c4df3b072f84aa969b",
"canvaskit/chromium/canvaskit.js": "901bb9e28fac643b7da75ecfd3339f3f",
"canvaskit/chromium/canvaskit.js.symbols": "ee7e331f7f5bbf5ec937737542112372",
"canvaskit/chromium/canvaskit.wasm": "399e2344480862e2dfa26f12fa5891d7",
"canvaskit/skwasm.js": "5d4f9263ec93efeb022bb14a3881d240",
"canvaskit/skwasm.js.symbols": "c3c05bd50bdf59da8626bbe446ce65a3",
"canvaskit/skwasm.wasm": "4051bfc27ba29bf420d17aa0c3a98bce",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"favicon.ico": "12ed06f3b7e060caba06f00e915943e7",
"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"flutter_bootstrap.js": "030fc4b3aa677c598dcb225577c63ef7",
"icons/Icon-192.png": "766206605d034db16e9aba780e7c19bf",
"icons/Icon-512.png": "230463ea9724c01158004785c142ed94",
"index.html": "251629417fb0160918154b6717122e63",
"/": "251629417fb0160918154b6717122e63",
"main.dart.js": "55ef7c1f49a3c0a42e0b7a5bcd1d749d",
"manifest.json": "7c554cc23771be6b7d65c3f3e14eb560",
"version.json": "f2776bb7204e9a0562dd988f37ad84b5"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
