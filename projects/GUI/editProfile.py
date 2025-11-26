import customtkinter as ctk
from PIL import Image

ctk.set_appearance_mode("light")
ctk.set_default_color_theme("blue")

PRIMARY = "#632B6B"
SECONDARY = "#A179A7"


class EditProfileGUI(ctk.CTk):

    def __init__(self):
        super().__init__()

        self.title("Edit Profile")
        self.geometry("390x780")
        self.configure(fg_color="white")

        # ---------- HEADER ----------
        header = ctk.CTkFrame(self, fg_color="transparent")
        header.pack(fill="x", pady=10)

        back_btn = ctk.CTkButton(
            header,
            text="←",
            width=40,
            fg_color="transparent",
            hover=False,
            text_color="black",
            font=("Roboto", 18)
        )
        back_btn.pack(side="left", padx=10)

        title = ctk.CTkLabel(
            header,
            text="Edit Profile",
            font=("Roboto", 20, "bold"),
            text_color="black"
        )
        title.pack(side="left", padx=5)

        # ---------- PROFILE IMAGE ----------
        avatar_frame = ctk.CTkFrame(self, fg_color="transparent")
        avatar_frame.pack(pady=20)

        avatar_img = ctk.CTkImage(
            Image.open("images/profileIcon.png"),
            size=(120, 120)
        )

        avatar_label = ctk.CTkLabel(avatar_frame, image=avatar_img, text="")
        avatar_label.pack()

        edit_btn = ctk.CTkButton(
            avatar_frame,
            text="✎",
            width=30,
            height=30,
            fg_color=PRIMARY,
            text_color="white",
            corner_radius=15
        )
        edit_btn.place(relx=0.75, rely=0.75)

        # ---------- FORM ----------
        form_frame = ctk.CTkFrame(self, fg_color="transparent")
        form_frame.pack(fill="x", padx=20)

        self.create_input(form_frame, "👤  Dinmukhamed Appaz")
        self.create_input(form_frame, "📅  01/01/1988")
        self.create_input(form_frame, "✉️  dinmukhamed@gmail.com")

        # Phone number
        phone_frame = ctk.CTkFrame(form_frame, fg_color="transparent")
        phone_frame.pack(fill="x", pady=10)

        country = ctk.CTkOptionMenu(
            phone_frame,
            values=["+1 (US)", "+7 (KZ)", "+44 (UK)"],
            width=100
        )
        country.pack(side="left", padx=(0, 10))

        phone_entry = ctk.CTkEntry(
            phone_frame,
            placeholder_text="(308) 555-0121",
            height=40,
            corner_radius=10
        )
        phone_entry.pack(side="left", fill="x", expand=True)

        # Gender field
        gender_btn = ctk.CTkButton(
            form_frame,
            text="Gender   >",
            fg_color="transparent",
            text_color="black",
            border_color="#e0e0e0",
            border_width=1,
            height=40,
            anchor="w"
        )
        gender_btn.pack(fill="x", pady=10)

    def create_input(self, parent, placeholder):
        entry = ctk.CTkEntry(
            parent,
            placeholder_text=placeholder,
            height=40,
            corner_radius=10,
            border_color="#e0e0e0"
        )
        entry.pack(fill="x", pady=10)


if __name__ == "__main__":
    app = EditProfileGUI()
    app.mainloop()
