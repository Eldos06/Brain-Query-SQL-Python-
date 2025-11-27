import customtkinter as ctk
from PIL import Image
import os
import json

PURPLE = "#632B6B"
PURPLE_HOVER = "#53235A"

DATA_FILE = "cards_data.json"


class App(ctk.CTk):
    def __init__(self):
        super().__init__()
        self.geometry("390x780")
        self.title("Library")

        # Хранилище карт в памяти
        self.cards = []
        self.load_cards()

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
            .pack(anchor="w", pady=(20, 0), side="left")

        ctk.CTkLabel(top_frame, text="Newest ↑", text_color=PURPLE)\
            .pack(side="right", pady=(20, 0))

        self.lesson_card("images/history.png", "History of Kazakhstan", "100 Questions", 0.2)
        self.lesson_card("images/physics.png", "Physics", "37 Questions", 0.7)

        ctk.CTkFrame(self, fg_color="transparent").pack(expand=True, fill="both")

        nav = ctk.CTkFrame(self, height=80, fg_color="#1E1E1E", corner_radius=0)
        nav.pack(side="bottom", fill="x")

        self.nav_button(nav, "images/libraryIcon.png", "Library", self.open_library)
        self.nav_button(nav, "images/createIcon.png", "Create", self.open_create_card)
        self.nav_button(nav, "images/profileIcon.png", "Profile", self.open_profile)


    # ---------- NAV BUTTON ----------
    def nav_button(self, parent, icon_path, text, command):
        icon = ctk.CTkImage(Image.open(icon_path), size=(36, 36)) if os.path.exists(icon_path) else None
        btn = ctk.CTkButton(
            parent,
            text=text,
            image=icon,
            compound="top",
            fg_color="transparent",
            hover_color="#2A2A2A",
            text_color=PURPLE,
            font=("Roboto", 16, "normal"),
            command=command
        )
        btn.pack(side="left", expand=True, pady=10)


    # ---------- CREATE CARD WINDOW ----------
    def open_create_card(self):
        win = ctk.CTkToplevel(self)
        win.title("Create Card")
        win.geometry("350x400")

        ctk.CTkLabel(win, text="Create New Card", font=("Roboto", 20)).pack(pady=15)

        question_entry = ctk.CTkEntry(win, placeholder_text="Question")
        question_entry.pack(pady=10, fill="x", padx=20)

        answer_entry = ctk.CTkEntry(win, placeholder_text="Answer")
        answer_entry.pack(pady=10, fill="x", padx=20)

        def save_card():
            card = {
                "question": question_entry.get(),
                "answer": answer_entry.get()
            }
            self.cards.append(card)
            self.save_cards()
            win.destroy()

        ctk.CTkButton(
            win,
            text="Save Card",
            fg_color=PURPLE,
            hover_color=PURPLE_HOVER,
            command=save_card
        ).pack(pady=20)


    # ---------- PROFILE ----------
    def open_profile(self):
        win = ctk.CTkToplevel(self)
        win.title("Profile")
        win.geometry("300x300")

        ctk.CTkLabel(win, text="Profile Screen", font=("Roboto", 20)).pack(pady=30)
        ctk.CTkLabel(win, text="(Will connect later)").pack()


    # ---------- STORAGE ----------
    def save_cards(self):
        with open(DATA_FILE, "w", encoding="utf-8") as f:
            json.dump(self.cards, f, indent=4)

    def load_cards(self):
        if os.path.exists(DATA_FILE):
            with open(DATA_FILE, "r", encoding="utf-8") as f:
                self.cards = json.load(f)


    def open_library(self):
        pass


    def lesson_card(self, img_path, title, subtitle, progress):
        card = ctk.CTkFrame(self, corner_radius=15)
        card.pack(padx=20, pady=10, fill="x")

        img = ctk.CTkImage(Image.open(img_path), size=(80, 80)) if os.path.exists(img_path) else None

        ctk.CTkLabel(card, image=img, text="").grid(row=0, column=0, rowspan=3, padx=10, pady=10)
        ctk.CTkLabel(card, text=title, font=("Roboto", 18, "normal")).grid(row=0, column=1, sticky="w")
        ctk.CTkLabel(card, text=subtitle).grid(row=1, column=1, sticky="w")

        bar = ctk.CTkProgressBar(card, progress_color=PURPLE)
        bar.set(progress)
        bar.grid(row=2, column=1, sticky="ew", padx=5, pady=5)


if __name__ == "__main__":
    app = App()
    app.mainloop()
