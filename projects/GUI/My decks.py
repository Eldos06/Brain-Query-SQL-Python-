import customtkinter as ctk
from PIL import Image
import os  # Added import for os to handle paths


# --- Ensure image paths are correct for the example to run ---
# If you run this code, make sure you have the 'images' folder with the required files.
# For demonstration purposes, this example assumes the images exist.

PURPLE = "#632B6B"
PURPLE_HOVER = "#53235A"

class App(ctk.CTk):
    def __init__(self):
        super().__init__()
        self.geometry("390x780")
        self.title("Library")

        # Configure the grid to allow an expanding central area if using grid layout,
        # but the current design uses pack, which is fine if managed correctly.

        ctk.CTkLabel(self, text="Library", font=("Roboto", 26, "normal"))\
            .pack(anchor="w", padx=20, pady=(50, 0))

        ctk.CTkButton(
            self,
            text="My Quizzes",
            width=200,
            height=40,
            corner_radius=16,
            font=("Roboto", 18, "normal"),
            fg_color=PURPLE,
            hover_color=PURPLE_HOVER
        ).pack(anchor="w", padx=15, pady=(60, 0))

        top_frame = ctk.CTkFrame(self, fg_color="transparent")
        top_frame.pack(fill="x", padx=20, pady=10)

        ctk.CTkLabel(top_frame, text="My Lessons", font=("Roboto", 18, "normal"))\
            .pack(anchor="w", pady=(20, 0), side="left") # Added side="left"

        ctk.CTkLabel(top_frame, text="Newest ↑", text_color=PURPLE)\
            .pack(side="right", pady=(20, 0)) # Aligned vertically with "My Lessons"

        # --- Lesson Cards (moved and reduced to avoid overcrowding) ---
        self.lesson_card("images/history.png", "History of Kazakhstan", "100 Questions", 0.2)
        self.lesson_card("images/physics.png", "Physics", "37 Questions", 0.7)

        # -----------------------------------------------------------
        # KEY CHANGE: This frame expands and pushes everything below it to the bottom
        # It needs to be the last thing packed *before* the permanent bottom elements
        ctk.CTkFrame(self, fg_color="transparent").pack(expand=True, fill="both")
        # -----------------------------------------------------------

        # NAV BAR
        nav = ctk.CTkFrame(self, height=80, fg_color="#1E1E1E", corner_radius=0) # corner_radius added for seamless bottom
        nav.pack(side="bottom", fill="x")

        def nav_button(parent, icon_path, text, command):
            # Use os.path.exists for cleaner error handling if images are missing
            if os.path.exists(icon_path):
                icon = ctk.CTkImage(Image.open(icon_path), size=(36, 36))
            else:
                print(f"Warning: Icon not found at {icon_path}. Using text only button.")
                icon = None

            btn = ctk.CTkButton(
                parent,
                text=text,
                image=icon,
                compound="top",
                fg_color="transparent",
                hover_color="#2A2A2A",
                text_color=PURPLE,
                font=("Roboto", 14, "normal"),
                command=command
            )
            # This pack layout correctly distributes buttons horizontally within the 'nav' frame
            btn.pack(side="left", expand=True, pady=10)

        # The nav buttons are correctly packed here using the nav frame as parent
        nav_button(nav, "images/libraryIcon.png", "Library", lambda: None)
        nav_button(nav, "images/createIcon.png", "Create", lambda: None)
        nav_button(nav, "images/profileIcon.png", "Profile", lambda: None)

    def lesson_card(self, img_path, title, subtitle, progress):
        card = ctk.CTkFrame(self, corner_radius=15)
        card.pack(padx=20, pady=10, fill="x")

        # Basic image handling for the card
        if os.path.exists(img_path):
            img = ctk.CTkImage(Image.open(img_path), size=(80, 80))
        else:
            print(f"Warning: Card image not found at {img_path}. Using placeholder.")
            img = None # CTkLabel handles None gracefully

        ctk.CTkLabel(card, image=img, text="").grid(row=0, column=0, rowspan=3, padx=10, pady=10)

        ctk.CTkLabel(card, text=title, font=("Roboto", 18, "normal")).grid(row=0, column=1, sticky="w")
        ctk.CTkLabel(card, text=subtitle).grid(row=1, column=1, sticky="w")

        bar = ctk.CTkProgressBar(card, progress_color=PURPLE)
        bar.set(progress)
        bar.grid(row=2, column=1, sticky="ew", padx=5, pady=5)

# This part ensures the script runs when executed
if __name__ == "__main__":
    app = App()
    app.mainloop()
