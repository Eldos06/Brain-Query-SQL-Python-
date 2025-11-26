import customtkinter as ctk
from PIL import Image

ctk.set_appearance_mode("dark")
ctk.set_default_color_theme("dark-blue")

PRIMARY = "#632B6B"
SECONDARY = "#A179A7"
BG_DARK = "#0f0f0f"


class AddCardGUI(ctk.CTk):

    def __init__(self):
        super().__init__()

        self.title("Add Card")
        self.geometry("400x780")
        self.configure(fg_color=BG_DARK)

        # ---------------- HEADER ----------------
        header = ctk.CTkFrame(self, fg_color="transparent")
        header.pack(fill="x", pady=(10, 0))

        back_btn = ctk.CTkButton(
            header, text="←", width=40,
            fg_color="transparent", hover=False,
            text_color=SECONDARY, font=("Roboto", 22)
        )
        back_btn.pack(side="left", padx=10)

        title_lbl = ctk.CTkLabel(
            header, text="Add",
            font=("Roboto", 28, "bold"),
            text_color=PRIMARY
        )
        title_lbl.pack(side="left", padx=10)

        save_btn = ctk.CTkButton(
            header, text="✓", width=40,
            fg_color="transparent", hover=False,
            text_color=SECONDARY, font=("Roboto", 24)
        )
        save_btn.pack(side="right", padx=10)

        # ---------------- TYPE + DECK ----------------
        section_frame = ctk.CTkFrame(self, fg_color="transparent")
        section_frame.pack(fill="x", pady=(10, 10), padx=10)

        type_lbl = ctk.CTkLabel(section_frame, text="Type:", font=("Roboto", 18), text_color=SECONDARY)
        type_lbl.grid(row=0, column=0, sticky="w")

        self.type_menu = ctk.CTkOptionMenu(
            section_frame,
            values=["Basic", "Cloze", "Basic (and reversed)"],
            fg_color=PRIMARY,
            button_color=SECONDARY,
            button_hover_color=PRIMARY
        )
        self.type_menu.grid(row=0, column=1, padx=10, sticky="e")

        deck_lbl = ctk.CTkLabel(section_frame, text="Deck:", font=("Roboto", 18), text_color=SECONDARY)
        deck_lbl.grid(row=1, column=0, sticky="w", pady=(10, 0))

        self.deck_menu = ctk.CTkOptionMenu(
            section_frame,
            width=260,
            values=["University::term_3::OOP::lecture_8"],
            fg_color=PRIMARY,
            button_color=SECONDARY,
            button_hover_color=PRIMARY
        )
        self.deck_menu.grid(row=1, column=1, padx=10, pady=(10, 0), sticky="e")

        # ---------------- FRONT FIELD ----------------
        self.front_label = ctk.CTkLabel(self, text="Front", font=("Roboto", 16), text_color=PRIMARY)
        self.front_label.pack(anchor="w", padx=15)

        self.front_text = ctk.CTkTextbox(
            self,
            height=120,
            corner_radius=10,
            fg_color=SECONDARY,
            text_color="black"
        )
        self.front_text.pack(fill="x", padx=15, pady=(5, 20))

        # ---------------- BACK FIELD ----------------
        self.back_label = ctk.CTkLabel(self, text="Back", font=("Roboto", 16), text_color=PRIMARY)
        self.back_label.pack(anchor="w", padx=15)

        self.back_text = ctk.CTkTextbox(
            self,
            height=120,
            corner_radius=10,
            fg_color=SECONDARY,
            text_color="black"
        )
        self.back_text.pack(fill="x", padx=15, pady=(5, 20))

        # ---------------- CARD INFO ----------------
        cards_frame = ctk.CTkFrame(self, fg_color=PRIMARY, corner_radius=12)
        cards_frame.pack(fill="x", padx=15, pady=(0, 20))

        cards_lbl = ctk.CTkLabel(
            cards_frame,
            text="Cards: Card 1",
            font=("Roboto", 16),
            text_color="white"
        )
        cards_lbl.pack(pady=10, padx=10, anchor="w")

        # ---------------- BOTTOM TOOLBAR ----------------
        toolbar = ctk.CTkFrame(self, fg_color=PRIMARY, height=50)
        toolbar.pack(fill="x", side="bottom")

        for icon in ["B", "I", "U", "—", "T", "Tt", "Σ", "+"]:
            btn = ctk.CTkButton(
                toolbar,
                text=icon,
                width=40,
                fg_color="transparent",
                hover_color=SECONDARY,
                text_color="white",
                border_color=SECONDARY,
                border_width=1
            )
            btn.pack(side="left", padx=5, pady=5)


if __name__ == "__main__":
    app = AddCardGUI()
    app.mainloop()
