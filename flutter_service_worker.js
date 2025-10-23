'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "d4acbebfbad446a7b7f1955c275a9429",
"version.json": "b28db252d824fbff6a272bb0bf1ab11d",
"index.html": "7c686d767d23645ff570a85a26954b0b",
"/": "7c686d767d23645ff570a85a26954b0b",
"main.dart.js": "c5ec5b211fe7209640fd74d225e9644d",
"flutter.js": "888483df48293866f9f41d3d9274a779",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "d61ec6dd90f346f4344418351efb3ab5",
"assets/AssetManifest.json": "684176ed918005ed6f5c540bb82ec0d1",
"assets/NOTICES": "fe2f109d3ede041667084fe1da0f09d8",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/AssetManifest.bin.json": "edf29b54489e070d286f873cee2c0e5b",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "49cce7478b0c0ffcab563f1401265f72",
"assets/fonts/MaterialIcons-Regular.otf": "862f16fe83a7edeffa1e38c27774a4d9",
"assets/assets/images/user.jpg": "fc023a36ee2bbb3875ecd01eb7d69f20",
"assets/assets/images/user2.png": "570a1e0aee539c66233212d9efb77fa3",
"assets/assets/images/user1.png": "ddc57477280695f18037a70597e3a549",
"assets/assets/images/logo.png": "780b3c7ec4e66e5b4e209d0982de974d",
"assets/assets/images/notification2.png": "8b76d951be2f6f543a7a114ec45f1991",
"assets/assets/images/splash_screen.png": "9ad4b27e0eb246f3b0d91c0996b25d33",
"assets/assets/images/notification1.png": "9951b5338fe5e3ebb0496e6d0388ebbf",
"assets/assets/images/admin.png": "be9fd53acb3249e6bd49fcae626e9859",
"assets/assets/icons/work.png": "87c78ab1fc1434729d327aa3049729c5",
"assets/assets/icons/briefcasePink.png": "1b0b10400a6ebdc3c26808026e28a5ff",
"assets/assets/icons/users_inactive.png": "403012aa175543cb608ace37fbb43f69",
"assets/assets/icons/position.png": "f89c469ae1357ab7bc95a155ba46e322",
"assets/assets/icons/store.png": "60f10205c9d3937992f68105847449cf",
"assets/assets/icons/edit_icon.png": "5c54c2a492c64490432ac6511b82456c",
"assets/assets/icons/dollar_sign.png": "95cde96a2270d0796635d9da1ecf62ea",
"assets/assets/icons/delete_icon.png": "ac570773b8ba80b4f34f54e3e2d21ab5",
"assets/assets/icons/totalProfessional.png": "646f3b1db5c188013fae05d073bdc784",
"assets/assets/icons/briefcase.png": "f72fb68b9b924c47426b8207f29f9f57",
"assets/assets/icons/reports_inactive.png": "e328cdf7eba8898f0768b51da1a772ca",
"assets/assets/icons/logout.png": "065317e38daa634cb02e16125ec8d781",
"assets/assets/icons/settings_inactive.png": "fce6bb2955b9e4994c3015d702790786",
"assets/assets/icons/search.png": "46adc30fd4d05b527044d05ca4d27982",
"assets/assets/icons/jobs_inactive.png": "1ed10d1e8dd54df948c37f9d01006f9a",
"assets/assets/icons/dashboard_active.png": "10b2687f4c7040b669119dc658b7e302",
"assets/assets/icons/reports_active.png": "c70eead90f40a96474317bc591d101f1",
"assets/assets/icons/view_icon.png": "95fbce34b3a2ed3ab0ac7b15da566248",
"assets/assets/icons/briefcaseActive.png": "81106d8fe5cfde644df31c590e3413b0",
"assets/assets/icons/settings_active.png": "3949361588f284762de6c2a21ce410bd",
"assets/assets/icons/dashboard_inactive.png": "7c0db81e22d0466cca3e31406f647177",
"assets/assets/icons/users_active.png": "3a429f52bbc58baeacfa57199531d51b",
"assets/assets/icons/jobs_active.png": "adf49d26eda04d5263f20ff6766ef50a",
"assets/assets/icons/applications_icon.png": "a6ac6ca9b68eafc4b1e706c604480658",
"canvaskit/skwasm.js": "1ef3ea3a0fec4569e5d531da25f34095",
"canvaskit/skwasm_heavy.js": "413f5b2b2d9345f37de148e2544f584f",
"canvaskit/skwasm.js.symbols": "0088242d10d7e7d6d2649d1fe1bda7c1",
"canvaskit/canvaskit.js.symbols": "58832fbed59e00d2190aa295c4d70360",
"canvaskit/skwasm_heavy.js.symbols": "3c01ec03b5de6d62c34e17014d1decd3",
"canvaskit/skwasm.wasm": "264db41426307cfc7fa44b95a7772109",
"canvaskit/chromium/canvaskit.js.symbols": "193deaca1a1424049326d4a91ad1d88d",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/chromium/canvaskit.wasm": "24c77e750a7fa6d474198905249ff506",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/canvaskit.wasm": "07b9f5853202304d3b0749d9306573cc",
"canvaskit/skwasm_heavy.wasm": "8034ad26ba2485dab2fd49bdd786837b"};
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
