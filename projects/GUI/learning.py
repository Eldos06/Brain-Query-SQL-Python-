import customtkinter as ctk
from PIL import Image
import os

# Define the color used for the button (a shade of purple)
PURPLE = "#632B6B"
PURPLE_HOVER = "#53235A"

class LearningApp(ctk.CTk):
    def __init__(self):
        super().__init__()

        # Configure the main window appearance
        self.geometry("390x780") # Approximate iPhone 14 size for realistic viewing
        self.title("Learning Screen (Dark Mode)")
        # KEY CHANGE: Set appearance mode to "dark"
        ctk.set_appearance_mode("dark")

        # --- Layout using grid ---
        # Configure grid weight to allow the main content area to expand
        self.grid_rowconfigure(0, weight=1)
        self.grid_columnconfigure(0, weight=1)

        # Main content frame (transparent, just a container)
        main_frame = ctk.CTkFrame(self, fg_color="transparent")
        main_frame.grid(row=0, column=0, sticky="nsew", padx=20, pady=20)
        main_frame.grid_rowconfigure(0, weight=1) # Allow space above the card
        main_frame.grid_rowconfigure(1, weight=1) # Allow space below the card

        # --- The Central "Apple" Card ---
        # Removed explicit fg_color="white" to let CTk manage card color in dark mode
        card_frame = ctk.CTkFrame(main_frame, corner_radius=15,
                                  height=100)
        # Use pack inside the grid cell to center it
        card_frame.pack(expand=True, anchor="center", fill="x")

        # Configure card grid for image and text placement
        card_frame.grid_columnconfigure(0, weight=0) # Image column
        card_frame.grid_columnconfigure(1, weight=1) # Text column

        # Load the Apple image
        image_path = "images/apple.png"
        if os.path.exists(image_path):
            apple_image = ctk.CTkImage(Image.open(image_path), size=(80, 80))
            ctk.CTkLabel(card_frame, image=apple_image, text="").grid(row=0, column=0, padx=(20, 10), pady=10, sticky="e")
        else:
            # Placeholder if image is missing
            ctk.CTkLabel(card_frame, text="", font=("Roboto", 16)).grid(row=0, column=0, padx=(20, 10), pady=10, sticky="e")

        # The word "Apple"
        # Removed explicit text_color="black" to let CTk manage text color in dark mode
        ctk.CTkLabel(card_frame, text="Apple", font=("Roboto", 30, "normal"))\
            .grid(row=0, column=1, padx=(10, 20), pady=10, sticky="w")


        # --- The Bottom Button Area ---
        # A frame for the bottom button, positioned at the very bottom of the main window
        bottom_frame = ctk.CTkFrame(self, fg_color="transparent", height=100)
        bottom_frame.grid(row=1, column=0, sticky="swe", padx=20, pady=(0, 40))

        # The "Show Answer" Button
        ctk.CTkButton(
            bottom_frame,
            text="Show Answer",
            height=50,
            corner_radius=15,
            font=("Roboto", 20, "normal"),
            fg_color=PURPLE,
            hover_color=PURPLE_HOVER,
            text_color="white" # Text remains white on the purple button
        ).pack(fill="x", expand=True)


if __name__ == "__main__":
    app = LearningApp()
    app.mainloop()
