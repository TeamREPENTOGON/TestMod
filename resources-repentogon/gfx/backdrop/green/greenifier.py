from pathlib import Path
from PIL import Image


def make_green(percentage: float):
    """Increases the green channel of every PNG in the current directory by N%."""
    # Factor to multiply the green channel (e.g., 20% increase -> 1.2)
    factor = 1 + (percentage / 100.0)

    # Search for all PNG files in the current working directory
    current_dir = Path.cwd()
    png_files = [
        f
        for f in current_dir.glob("*.png")
        if not f.stem.endswith("_green")
    ]

    if not png_files:
        print("No eligible PNG files found in the current directory.")
        return

    for file_path in png_files:
        # Open image and ensure it has an Alpha channel (RGBA)
        with Image.open(file_path) as img:
            img = img.convert("RGBA")

            # Split channels into Red, Green, Blue, Alpha
            r, g, b, a = img.split()

            # Increase the green channel value, capped at maximum brightness (255)
            g = g.point(lambda p: min(255, int(p * factor)))

            # Merge modified channels back together
            modified_img = Image.merge("RGBA", (r, g, b, a))

            # Save as <ORIGINALNAME>_green.png
            output_filename = f"{file_path.stem}_green.png"
            output_path = current_dir / output_filename
            modified_img.save(output_path)

            print(f"Created: {output_filename}")


if __name__ == "__main__":
    try:
        n = float(input("Enter percentage to increase green by (e.g., 20): "))
        make_green(n)
        print("Done!")
    except ValueError:
        print("Invalid input. Please enter a valid number.")
