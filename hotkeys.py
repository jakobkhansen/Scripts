import keyboard
import pyautogui
import time
import random

pyautogui.PAUSE = 0.02
ITEM_DISTANCE_VERTICAL = 42.5
ITEM_DISTANCE_HORIZONTAL = 50

def UpDown(interval, ending_hotkeys):
    distance = ITEM_DISTANCE_VERTICAL

    while all(keyboard.is_pressed(key) == False for key in ending_hotkeys):
        pyautogui.moveRel(0, distance)
        pyautogui.click()
        distance *= -1
        if interval > 0:
            time.sleep(interval)

def InventoryDrop(rows, singles, direction):

    movement_single = ITEM_DISTANCE_VERTICAL*direction
    movement_row_height = -(ITEM_DISTANCE_VERTICAL*6*direction)
    movement_row_width = ITEM_DISTANCE_HORIZONTAL*direction

    if direction == -1:
        shift_click()
        for _ in range(singles):
            pyautogui.moveRel(0, movement_single)
            shift_click()
        pyautogui.moveRel(movement_row_width, movement_row_height)

    # First three rows
    for _ in range(rows):
        shift_click()
        for _ in range(6):
            pyautogui.moveRel(0, movement_single)
            shift_click()
            time.sleep(0.01)
        pyautogui.moveRel(movement_row_width, movement_row_height)

    # Last row
    if direction == 1:
        shift_click()
        for _ in range(singles):
            pyautogui.moveRel(0, movement_single)
            shift_click()

def HighAlcemyClicker(ending_hotkeys):
    timing = random.randrange(10, 15, 1)/10

    while all(keyboard.is_pressed(key) == False for key in ending_hotkeys):
        pyautogui.click()
        time.sleep(timing)

def ConstructionRightClicks(item, action):
    items = {
        "oak-larder":[60, 80, "2"],
        "oak-dungeon-door":[60, 120, "1"]
    }

    actions = {
        "build":0,
        "remove":1
    }

    action_index = actions[action]
    params = items[item]

    pyautogui.click(button="right")
    time.sleep(0.05)
    pyautogui.moveRel(0, params[action_index])
    time.sleep(0.025)
    pyautogui.click()
    if action == "build":
        pyautogui.keyDown(params[2])
        time.sleep(0.8)
        pyautogui.keyUp(params[2])

    if action == "remove":
        pyautogui.keyDown("1")
        time.sleep(0.8)
        pyautogui.keyUp("1")

    time.sleep(0.5)
    pyautogui.moveRel(0, -(params[action_index]))

def BuildAndRemove(item):
    ConstructionRightClicks(item, "build")
    time.sleep(0.6)
    ConstructionRightClicks(item, "remove")
    time.sleep(0.2)
    ConstructionRightClicks(item, "build")
    time.sleep(0.6)
    ConstructionRightClicks(item, "remove")

def Autoclicker(interval_range, stop_keys):
    while all(keyboard.is_pressed(key) == False for key in stop_keys):
        wait = random.randrange(interval_range[0]*10, interval_range[1]*10, 1)/10
        pyautogui.click()
        time.sleep(wait)

def AutoDoubleClick(interval_range, stop_keys):
    while all(keyboard.is_pressed(key) == False for key in stop_keys):
        wait = random.randrange(interval_range[0]*10, interval_range[1]*10, 1)/10
        pyautogui.click()
        time.sleep(random.randrange(1))
        pyautogui.click()
        time.sleep(wait)

def ThievingClicker(interval_range, stop_keys):

    while all(keyboard.is_pressed(key) == False for key in stop_keys):
        pyautogui.moveRel(-215, -90)
        for click in range(40):
            if all(keyboard.is_pressed(key) == False for key in stop_keys):
                wait = random.randrange(interval_range[0]*10, interval_range[1]*10, 1)/10
                pyautogui.click()
                time.sleep(wait)
        pyautogui.moveRel(215, 90)
        time.sleep(0.2)
        for clicks in range(2):
            pyautogui.click()
            time.sleep(0.3)




# Helper functions
def shift_click():
    pyautogui.keyDown('shift')
    pyautogui.click()
    pyautogui.keyUp('shift')


# Runecrafting
# keyboard.add_hotkey('shift+z', UpDown, args=(0.2, [275],))

# Fishing
# keyboard.add_hotkey(276, InventoryDrop, args=(3,4,1,))
# keyboard.add_hotkey('shift+z', InventoryDrop, args=(3,4,1,))
# keyboard.add_hotkey(275, InventoryDrop, args=(3,4,-1,))
# keyboard.add_hotkey('shift+x', InventoryDrop, args=(3,4,-1,))

# Magic
# keyboard.add_hotkey('shift+z', HighAlcemyClicker, args=(['shift+x']))

# Construction
# keyboard.add_hotkey('z', ConstructionRightClicks, args=("oak-dungeon-door", "build"))
# keyboard.add_hotkey('x', ConstructionRightClicks, args=("oak-dungeon-door", "remove"))
# keyboard.add_hotkey('c', BuildAndRemove, args=("oak-dungeon-door",))

# Thieving
# keyboard.add_hotkey('c', Autoclicker, args=([0.3, 0.8], ['x']))
# keyboard.add_hotkey('z', ThievingClicker, args=([0.3, 0.8], ['x']))

# NMZ
keyboard.add_hotkey('shift+z', AutoDoubleClick, args=([45, 58], ['shift+x']))

keyboard.wait()
