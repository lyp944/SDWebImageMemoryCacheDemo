When the SDAnimatedImageView loads the animatedImage (eg WebP) and UIImageView later loads the same animatedImage, UIImageView will hit the SDAnimatedImage in the memory cache, At this point, UIImageView is showing a static image, the wrong cache was used.

当SDAnimatedImageView加载动图的时候（比如webp），之后UIImageView再加载这个动图时，UIImageView会命中内存缓存中的SDAnimatedImage，这时候UIImageView显示的是一个静态图片,使用了错误的缓存


