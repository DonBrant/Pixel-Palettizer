(define (pixel-palettizer image drawable scale colorcount dither)

	; scale image
	(gimp-context-set-interpolation 0)
	(let*
		(
			(width (car (gimp-image-width image)))
			(height (car (gimp-image-height image)))
		)
		(gimp-image-scale image (* scale width) (* scale height))
	)

	; index/colormap the iamge
	(catch () (gimp-image-convert-rgb image))
	(gimp-image-convert-indexed image dither 0 colorcount FALSE TRUE "Pixel Palette")
	
)

(script-fu-register
	"pixel-palettizer"
	"Pixel Palettizer"
	"Scale and colormap pixel art"
	"Donald Brant"
	"Copright 2022, Donald Brant"
	"11/22/22"
	""
	SF-IMAGE "Image" 0
	SF-DRAWABLE "Drawable" 0
	SF-VALUE "Scale" "4"
	SF-VALUE "Max Colors" "4"
	SF-OPTION "Dithering" '("None" "FS Normal" "FS Reduced Bleeding")
)

(script-fu-menu-register "pixel-palettizer" "<Image>")
  
