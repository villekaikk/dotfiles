from glob import glob
from random import randint
from typing import List
from shutil import copyfile, rmtree

import os


WALLPAPER_DIR = ""
CACHE_DIR = ""
ALLOWED_FILE_TYPES = ["png", "jpg", "jpeg"]


def get_all_wallpapers() -> List[str]:

    wallpapers = []
    
    for t in ALLOWED_FILE_TYPES:
        for wp in glob(os.path.join(WALLPAPER_DIR, f"*.{t}")):
            wallpapers.append(os.path.basename(wp))

    return wallpapers


def filter_random(items: List[str], limit: int) -> List[str]:

    selected_items = []

    while len(selected_items) < limit:
        ri = randint(0, len(items) - 1)

        if not items[ri] in selected_items:
            selected_items.append(items[ri])

    return selected_items


def clear_directory(dir_path: str) -> None:

    if os.path.exists(dir_path):
        rmtree(dir_path)
        #print(f"Removed directory {dir_path}")

    os.makedirs(dir_path)

def cache_wallpapers(items: List[str]) -> None:

    for i, item in enumerate(items):
        src = os.path.join(WALLPAPER_DIR, item)
        filename, ext = os.path.splitext(src)
        dst = os.path.join(CACHE_DIR, f"wallpaper_{i+1}{ext}")
        #print(dst)
        copyfile(src, dst)
        #print(f"Copied {item} to {dst}")


def main():
    
    wallpapers = get_all_wallpapers()
    #print(f"{len(wallpapers)} wallpapers found")

    if not wallpapers:
        #print("No wallpapers found")
        return
    
    selected_wallpapers = filter_random(wallpapers, 2)
            
    # for w in selected_wallpapers:
    #     print(w)
    #     pass
    
    clear_directory(CACHE_DIR)
    cache_wallpapers(selected_wallpapers)


if __name__ == "__main__":
    main()
