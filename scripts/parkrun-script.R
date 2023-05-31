library(hexSticker)

hi <- system.file("images/parkrun-image.png", package="hexSticker")

sticker(hi, package="hexSticker", p_size=20, s_x=1, s_y=.75, s_width=.6,
        filename="inst/figures/imgfile.png")

