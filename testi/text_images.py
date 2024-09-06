import cv2 
import numpy as np 

I = cv2.imread("lt_slike/0009.png")

height, width, _ = I.shape
mask = np.zeros_like(I)

text = "TRPCA" 
font = cv2.FONT_HERSHEY_SIMPLEX 
font_scale = 1.3
font_color = (0, 0, 0)
font_color_mask = (255, 255, 255)
thickness = 2
text_position = (100, 350)

cv2.putText(I, text, text_position, font, font_scale, font_color, thickness, cv2.LINE_AA)
cv2.putText(mask, text, text_position, font, font_scale, font_color_mask, thickness, cv2.LINE_AA)

mask_gray = cv2.cvtColor(mask, cv2.COLOR_BGR2GRAY)
_, mask_binary = cv2.threshold(mask_gray, 1, 255, cv2.THRESH_BINARY)
num_pixels = cv2.countNonZero(mask_binary)

cv2.imshow("img",I)
cv2.waitKey(0)
cv2.destroyAllWindows()

cv2.imshow("mask",mask_binary)
cv2.waitKey(0)
cv2.destroyAllWindows()

print(f"Število zašumljenih pikslov: {num_pixels}")
print(f"Stopnja zašumljenosti: {num_pixels / (height*width)}")

cv2.imwrite("text_img_10.png", I)

