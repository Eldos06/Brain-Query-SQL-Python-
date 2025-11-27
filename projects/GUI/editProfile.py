import customtkinter as ctk
from PIL import Image

ctk.set_appearance_mode("dark")
ctk.set_default_color_theme("dark-blue")

PRIMARY = "#632B6B"
SECONDARY = "#A179A7"
BG_DARK = "#1C1C1E"
FIELD_BG = "#2C2C2E"


class EditProfileGUI(ctk.CTk):

    def __init__(self):
        super().__init__()

        self.title("Edit Profile")
        self.geometry("390x780")
        self.configure(fg_color=BG_DARK)

        # ---------- HEADER ----------
        header = ctk.CTkFrame(self, fg_color="transparent")
        header.pack(fill="x", pady=10)

        back_btn = ctk.CTkButton(
            header,
            text="←",
            width=40,
            fg_color="transparent",
            hover=False,
            text_color="white",
            font=("Roboto", 18)
        )
        back_btn.pack(side="left", padx=10)

        title = ctk.CTkLabel(
            header,
            text="Edit Profile",
            font=("Roboto", 20, "bold"),
            text_color="white"
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
            width=32,
            height=32,
            fg_color=PRIMARY,
            hover_color=SECONDARY,
            text_color="white",
            corner_radius=16
        )
        edit_btn.place(relx=0.75, rely=0.75)

        # ---------- FORM ----------
        form_frame = ctk.CTkFrame(self, fg_color="transparent")
        form_frame.pack(fill="x", padx=20)

        self.create_input(form_frame, "👤  Dinmukhamed Appaz")

        # DATE FIELD (CLICKABLE)
        self.date_entry = self.create_input(form_frame, "📅  01/01/1988")
        self.date_entry.bind("<Button-1>", lambda e: self.open_date_picker())

        self.create_input(form_frame, "✉️  dinmukhamed@gmail.com")

        # ---------- PHONE FIELD ----------
        phone_frame = ctk.CTkFrame(form_frame, fg_color="transparent")
        phone_frame.pack(fill="x", pady=10)

        self.phone_prefix = ctk.CTkComboBox(
            phone_frame,
            values=["+7", "87", "+1", "+44"],
            width=80,
            fg_color=FIELD_BG,
            border_color=PRIMARY,
            text_color="white",
            dropdown_fg_color=FIELD_BG,
            dropdown_text_color="white",
            button_color=PRIMARY,
            button_hover_color=SECONDARY
        )
        self.phone_prefix.set("+7")
        self.phone_prefix.pack(side="left", padx=(0, 10))

        self.phone_entry = ctk.CTkEntry(
            phone_frame,
            placeholder_text="7012345678",
            height=40,
            corner_radius=10,
            fg_color=FIELD_BG,
            border_color=PRIMARY,
            text_color="white"
        )
        self.phone_entry.pack(side="left", fill="x", expand=True)

        # ---------- GENDER FIELD ----------
        self.gender_select = ctk.CTkComboBox(
            form_frame,
            values=["Male", "Female", "Other"],
            fg_color=FIELD_BG,
            border_color=PRIMARY,
            text_color="white",
            dropdown_fg_color=FIELD_BG,
            dropdown_text_color="white",
            button_color=PRIMARY,
            button_hover_color=SECONDARY,
            height=40
        )
        self.gender_select.set("Gender")
        self.gender_select.pack(fill="x", pady=10)


    # ---------- INPUT BUILDER ----------
    def create_input(self, parent, placeholder):
        entry = ctk.CTkEntry(
            parent,
            placeholder_text=placeholder,
            height=40,
            corner_radius=10,
            fg_color=FIELD_BG,
            border_color=PRIMARY,
            text_color="white"
        )
        entry.pack(fill="x", pady=10)
        return entry


    # ---------- DATE PICKER ----------
    def open_date_picker(self):
        picker = ctk.CTkToplevel(self)
        picker.title("Select Date")
        picker.geometry("390x300+0+450")
        picker.configure(fg_color=BG_DARK)
        picker.grab_set()

        title = ctk.CTkLabel(
            picker,
            text="Date of Birth",
            font=("Roboto", 18, "bold"),
            text_color="white"
        )
        title.pack(pady=15)

        days = [str(i).zfill(2) for i in range(1, 32)]
        months = [
            "January", "February", "March", "April", "May", "June",
            "July", "August", "September", "October", "November", "December"
        ]
        years = [str(y) for y in range(1950, 2026)]

        day_box = ctk.CTkComboBox(picker, values=days)
        month_box = ctk.CTkComboBox(picker, values=months)
        year_box = ctk.CTkComboBox(picker, values=years)

        day_box.pack(pady=5)
        month_box.pack(pady=5)
        year_box.pack(pady=5)

        def set_date():
            selected = f"{day_box.get()}/{month_box.get()}/{year_box.get()}"
            self.date_entry.delete(0, "end")
            self.date_entry.insert(0, f"📅  {selected}")
            picker.destroy()

        update_btn = ctk.CTkButton(
            picker,
            text="Update",
            fg_color=PRIMARY,
            hover_color=SECONDARY,
            text_color="white",
            command=set_date
        )
        update_btn.pack(pady=20)


if __name__ == "__main__":
    app = EditProfileGUI()
    app.mainloop()
