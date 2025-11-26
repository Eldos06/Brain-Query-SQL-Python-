import customtkinter as ctk
from PIL import Image
import os

ctk.set_appearance_mode("dark")
ctk.set_default_color_theme("dark-blue")

BG_COLOR = "#0f0f13"
CARD_COLOR = "#1c1c22"
BORDER_COLOR = "#2a2a33"
PURPLE = "#8e5ea2"


class LearningApp(ctk.CTk):
    def __init__(self):
        super().__init__()
        self.geometry("390x780")
        self.title("Learning")
        self.configure(fg_color=BG_COLOR)

        # MAIN CONTAINER
        main = ctk.CTkFrame(self, fg_color=BG_COLOR)
        main.pack(expand=True, fill="both", padx=20, pady=20)

        # ------ CARD 1 : APPLE ------
        card1 = ctk.CTkFrame(
            main,
            corner_radius=20,
            fg_color=CARD_COLOR,
            border_color=BORDER_COLOR,
            border_width=2,
            height=110
        )
        card1.pack(fill="x", pady=(40, 15))

        card1.grid_columnconfigure(1, weight=1)

        # Image
        image_path = "images/apple.png"
        if not os.path.exists(image_path):
            os.makedirs("images", exist_ok=True)
            from PIL import ImageDraw
            img = Image.new("RGB", (100, 100), "red")
            img.save(image_path)

        apple_img = ctk.CTkImage(Image.open(image_path), size=(70, 70))

        ctk.CTkLabel(card1, image=apple_img, text="").grid(row=0, column=0, padx=15, pady=15)

        ctk.CTkLabel(
            card1,
            text="Apple",
            font=("Roboto", 30, "bold")
        ).grid(row=0, column=1, sticky="w")

        # ------ CARD 2 : ALMA ------
        card2 = ctk.CTkFrame(
            main,
            corner_radius=20,
            fg_color=CARD_COLOR,
            border_color=BORDER_COLOR,
            border_width=2,
            height=110
        )
        card2.pack(fill="x")

        ctk.CTkLabel(
            card2,
            text="Алма",
            font=("Roboto", 30, "bold")
        ).pack(pady=35)

        # ------ BOTTOM BUTTONS ------
        bottom = ctk.CTkFrame(main, fg_color="transparent")
        bottom.pack(side="bottom", fill="x", pady=40)  # Use fill="x" here

        labels = ["<1m", "<6m", "<10m", "<5d"]
        texts = ["Again", "Hard", "Good", "Easy"]

        # Configure the columns to expand equally
        for i in range(4):
            bottom.grid_columnconfigure(i, weight=1)

            ctk.CTkLabel(
                bottom,
                text=labels[i],
                text_color="gray"
            ).grid(row=0, column=i, padx=5)  # Adjusted padx for labels

            ctk.CTkButton(
                bottom,
                text=texts[i],
                # Removed fixed 'width=80' so it stretches with grid weight
                height=40,
                fg_color=PURPLE,
                hover_color="#a56bc2",
                corner_radius=20,
                font=("Roboto", 14, "bold")
            ).grid(row=1, column=i, padx=5, pady=5, sticky="ew")  # Use sticky="ew" to stretch


if __name__ == "__main__":
    app = LearningApp()
    app.mainloop()
