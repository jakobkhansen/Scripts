import keyboard
import pyautogui

pyautogui.PAUSE = 0.02

def UpDown():
    distance = 50
    while (not keyboard.is_pressed('x')):
        pyautogui.moveRel(0, distance)
        pyautogui.click()
        distance *= -1

keyboard.add_hotkey('shift+z', UpDown)

keyboard.wait()
