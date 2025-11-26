import customtkinter as ctk
from PIL import Image, ImageDraw, ImageTk
import os


# --- Цвета (Скорректированы для лучшего темного режима) ---
PURPLE = "#673AB7"
PURPLE_HOVER = "#58319e"
LIGHT_PURPLE_BG = "#d5cff9"
DARK_BG = "#1E1E1E"
CARD_BG = "#2C2C2C"
BUTTON_LIGHT = "#e0e0e0"


# --- Установка внешнего вида (темный режим) ---
ctk.set_appearance_mode("Dark")




# Helper function to create a circular image using PIL
# ЭТА ФУНКЦИЯ БОЛЬШЕ НЕ НУЖНА ДЛЯ АВАТАРА
def make_circle_image(image_path, size):
   """Opens an image, crops it to a square from the center, and applies a circular mask."""
   try:
       image = Image.open(image_path)


       width, height = image.size
       if width > height:
           left = (width - height) // 2
           right = (width + height) // 2
           top = 0
           bottom = height
           image = image.crop((left, top, right, bottom))
       elif height > width:
           left = 0
           right = width
           top = (height - width) // 2
           bottom = (height + width) // 2
           image = image.crop((left, top, right, bottom))


       image = image.resize(size, Image.Resampling.LANCZOS)
       mask = Image.new('L', size, 0)
       draw = ImageDraw.Draw(mask)
       draw.ellipse((0, 0) + size, fill=255)


       output = image.copy()
       if output.mode in ('RGBA', 'LA'):
           output.putalpha(mask)
       else:
           output = output.convert('RGBA')
           output.putalpha(mask)


       return output
   except FileNotFoundError:
       print(f"Warning: Image not found at {image_path}.")
       return None
   except Exception as e:
       print(f"An error occurred processing image {image_path}: {e}")
       return None




class ProfileApp(ctk.CTk):
   def __init__(self):
       super().__init__()
       self.title("Профиль пользователя CustomTkinter")
       self.geometry("400x750")


       # Так как теперь мы используем pack(), grid_rowconfigure больше не нужен
       # self.grid_rowconfigure(0, weight=1)
       # self.grid_columnconfigure(0, weight=1)
       # Устанавливаем макет окна на pack()
       self.pack_propagate(False)
       self.configure(bg=DARK_BG)


       # --- Заголовок и кнопка настроек ---
       # Используем pack() для простоты, как в вашем примере аватара
       header_frame = ctk.CTkFrame(self, fg_color="transparent")
       header_frame.pack(side="top", fill="x", padx=20, pady=(40, 20))
       header_frame.grid_columnconfigure(0, weight=1)  # Сохраняем grid внутри фрейма


       ctk.CTkLabel(header_frame, text="Profile", font=("Helvetica", 24, "bold")).grid(row=0, column=0, sticky="w")


       try:
           settings_image = ctk.CTkImage(Image.open("images/settings.png"), size=(24, 24))
           settings_button = ctk.CTkButton(header_frame, image=settings_image, text="", width=40, height=40,
                                           fg_color="transparent", hover_color="#444444")
           settings_button.grid(row=0, column=1, sticky="e")
       except FileNotFoundError:
           ctk.CTkLabel(header_frame, text="[Настройки]", text_color="gray").grid(row=0, column=1, sticky="e")


       # --- ИЗМЕНЕННЫЙ УЧАСТОК ДЛЯ КВАДРАТНОГО АВАТАРА (Ваш код) ---
       avatar_frame = ctk.CTkFrame(self, fg_color="transparent")
       avatar_frame.pack(pady=20)


       try:
           avatar_img_pil = Image.open("images/profileIcon.png")
           avatar_img = ctk.CTkImage(avatar_img_pil, size=(120, 120))
           avatar_label = ctk.CTkLabel(avatar_frame, image=avatar_img, text="")
           avatar_label.pack()
       except FileNotFoundError:
           ctk.CTkLabel(avatar_frame, text="[Аватар]", font=("Helvetica", 16), text_color=PURPLE).pack()
       # ----------------------------------------------------------------


       ctk.CTkLabel(self, text="Dinmukhamed Appaz", font=("Helvetica", 20, "bold")).pack(pady=(10, 0))
       ctk.CTkLabel(self, text="dinmukhamed@gmail.com", font=("Helvetica", 14), text_color="gray").pack(pady=(0, 20))


       # --- Кнопка редактирования ---
       edit_button = ctk.CTkButton(self, text="Edit Profile", corner_radius=20, fg_color=BUTTON_LIGHT,
                                   text_color="black", hover_color="#c0c0c0")
       edit_button.pack(pady=10, padx=50, fill="x")


       # --- Статистика ---
       ctk.CTkLabel(self, text="Statistics", font=("Helvetica", 18, "bold")).pack(pady=(40, 10), anchor="w", padx=20)


       stats_frame = ctk.CTkFrame(self, fg_color="transparent")
       stats_frame.pack(fill="x", padx=20)
       stats_frame.grid_columnconfigure((0, 1), weight=1)  # Используем grid внутри фрейма


       def create_stat_card(parent, icon_path, value, label_text, column):
           card_frame = ctk.CTkFrame(parent, corner_radius=10, fg_color=CARD_BG)
           card_frame.grid(row=0, column=column, padx=(0 if column == 0 else 10, 10 if column == 0 else 0), pady=10,
                           sticky="ew")


           inner_frame = ctk.CTkFrame(card_frame, fg_color="transparent")
           inner_frame.pack(padx=10, pady=10, fill="x")


           try:
               icon_image = ctk.CTkImage(Image.open(icon_path), size=(30, 30))
               icon_label = ctk.CTkLabel(inner_frame, image=icon_image, text="")
               icon_label.pack(side="left")
           except FileNotFoundError:
               ctk.CTkLabel(inner_frame, text="[Иконка]", text_color="gray").pack(side="left")


           value_label = ctk.CTkLabel(inner_frame, text=value, font=("Helvetica", 20, "bold"), padx=5)
           value_label.pack(side="left")


           label_text_label = ctk.CTkLabel(inner_frame, text=label_text, font=("Helvetica", 12), text_color="gray")
           label_text_label.pack(side="left")


       create_stat_card(stats_frame, "images/streak_current.png", "1", "Current streak", 0)
       create_stat_card(stats_frame, "images/streak_longest.png", "1", "Longest streak", 1)


       # --- НАВИГАЦИОННАЯ ПАНЕЛЬ (NAV BAR) ---
       self.nav_frame = ctk.CTkFrame(self, height=80, fg_color=DARK_BG, corner_radius=0)
       # Прикрепляем к нижней части окна с помощью pack()
       self.nav_frame.pack(side="bottom", fill="x")
       self.nav_frame.grid_columnconfigure((0, 1, 2), weight=1)


       def nav_button(parent, icon_path, text, column, is_active=False):
           icon = None
           if os.path.exists(icon_path):
               icon = ctk.CTkImage(Image.open(icon_path), size=(36, 36))


           fg_color = (PURPLE if is_active else "transparent")
           hover_color = (PURPLE_HOVER if is_active else "#2A2A2A")
           text_color = (PURPLE if is_active else "gray")


           btn = ctk.CTkButton(
               parent,
               text=text,
               image=icon,
               compound="top",
               fg_color=fg_color,
               hover_color=hover_color,
               text_color=text_color,
               font=("Roboto", 14, "normal"),
           )
           btn.grid(row=0, column=column, sticky="nsew", padx=0, pady=10)


       nav_button(self.nav_frame, "images/libraryIcon.png", "Library", 0)
       nav_button(self.nav_frame, "images/createIcon.png", "Create", 1)
       nav_button(self.nav_frame, "images/profileIcon.png", "Profile", 2, is_active=True)




# --- БЛОК ЗАПУСКА ПРИЛОЖЕНИЯ ---
if __name__ == "__main__":
   app = ProfileApp()
   app.mainloop()

