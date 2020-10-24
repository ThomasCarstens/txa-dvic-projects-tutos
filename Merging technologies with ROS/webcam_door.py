import cv2
import numpy as np
import time


cap = cv2.VideoCapture(0);
time.sleep(2.0)
timeCheck = time.time()
#-----Initializing mask for red color----
#l_b1 = np.array([0, 150, 25])
#u_b1= np.array([10, 255, 255])
#l_b2 = np.array([190, 40, 70])
#u_b2= np.array([180, 255, 255])


l_b1 = np.array([0, 180, 40])
u_b1= np.array([10, 255, 255])
l_b2 = np.array([80, 10, 80])
u_b2= np.array([160, 255, 255])

kernel = np.ones((3,3), np.uint8) #Matrix used for opening 

while True:
    #im = cap.fromarray(resizelist[val])
    _, frame = cap.read()


    hsv = cv2.cvtColor(frame, cv2.COLOR_BGR2HSV) #Camera video to HSV

    
    mask1 = cv2.inRange(hsv, l_b1, u_b1)

    mask2 = cv2.inRange(hsv, l_b2, u_b2)
    #-----Concatenate both mask-----
    mask = mask1 + mask2
    #-----Reduce Noise using morphology opening-----
    opening_masked_img = cv2.morphologyEx(mask, cv2.MORPH_OPEN, kernel)
    #-----Resulting image-----
    masked_img = cv2.bitwise_and(frame, frame, mask=mask)
    #-----Finding contours and drawing it on the result image-----
    ####ORIGINAL: contours, hierarchy = cv2.findContours(opening_masked_img, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)    
    (contours, hierarchy) = cv2.findContours(opening_masked_img, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)
    #cv2.drawContours(masked_img, contours, -1, (255,255,255), 3)
    for contours in contours:
	(x, y, w, h) = cv2.boundingRect(contours)
        #(x, y, w, h) = cv2.boundingRect(contours)  # sauvegarder coordonnees contours
        print(x,y)
        if cv2.contourArea(contours) < 3500:  # supprimer les petits contours, supprimer le bruit
            continue
        x2 = x + (w/2)
        y2 = y + (h/2)
        x2 = int(round(x2))
        y2 = int(round(y2))
        cv2.line(frame,(320,480),(x2,y2),(0,255,0),1)
        font = cv2.FONT_HERSHEY_COMPLEX
        
        if x2<320 :
            text = 'Gauche'
        else :
            text = 'Droite'
        cv2.putText(frame, text, (20, 20), font, 1, (0, 255, 0), 1, cv2.LINE_4)
        cv2.rectangle(frame, (x, y), (x + w, y + h), (0, 255, 0), 2)
        
#cv2.drawContours(frame, contours, -1, (0,255,0), 2)#dessiner contours

    cv2.imshow("frame", frame)
    cv2.imshow("mask1", mask1)
    cv2.imshow("mask2", mask2)
    cv2.imshow("mask", mask)
    cv2.imshow("opening", opening_masked_img)
    cv2.imshow("masked_img", masked_img)

    key = cv2.waitKey(1)
    if key == 27:
        break
    print (round((1/(time.time() - timeCheck))))
    timeCheck = time.time()

cap.release()
cv2.destroyAllWindows()
