import customtkinter as ctk
from PIL import Image


ctk.set_appearance_mode("light")
ctk.set_default_color_theme("purple")


SLIDES = [
    {
        "title": "Your Study Secret",
        "subtitle": "Custom AI quizzes & flashcards to boost your grades.",
        # сюда путь к картинке экрана 1
        "image": "image/brainquery_1.png",
    },
    {
        "title": "Study Wherever, Whenever",
        "subtitle": "Master your subjects at your own pace, anywhere, anytime.",
        "image": "image/brainquery_2.png",
    },
    {
        "title": "Snap to Create Instantly",
        "subtitle": "Generate quizzes & flashcards from a quick photo or upload.",
        "image": "image/brainquery_3.png",
    },
]


class Onboarding(ctk.CTkFrame):
    def __init__(self, master, slides, *args, **kwargs):
        super().__init__(master, *args, **kwargs)
        self.slides = slides
        self.index = 0
        self.images = []
        self._load_images()

        self.grid_columnconfigure(0, weight=1)
        self.grid_rowconfigure(3, weight=1)

        # top app name
        self.app_label = ctk.CTkLabel(self, text="BrainQuery",
                                      font=("SF Pro Display", 20, "bold"),
                                      text_color="#7A2BCB")
        self.app_label.grid(row=0, column=0, pady=(20, 10))

        # illustration area
        self.illustration_frame = ctk.CTkFrame(self, fg_color="white", corner_radius=30)
        self.illustration_frame.grid(row=1, column=0, padx=20, pady=(10, 10), sticky="nsew")
        self.illustration_frame.grid_rowconfigure(0, weight=1)
        self.illustration_frame.grid_columnconfigure(0, weight=1)

        self.illustration_label = ctk.CTkLabel(self.illustration_frame, text="")
        self.illustration_label.grid(row=0, column=0, padx=20, pady=20)

        # title
        self.title_label = ctk.CTkLabel(
            self,
            text="",
            font=("SF Pro Display", 22, "bold"),
            text_color="#7A2BCB",
        )
        self.title_label.grid(row=2, column=0, padx=20, pady=(10, 5))

        # subtitle
        self.subtitle_label = ctk.CTkLabel(
            self,
            text="",
            font=("SF Pro Text", 14),
            text_color="#8E8E93",
            wraplength=320,
        )
        self.subtitle_label.grid(row=3, column=0, padx=30, pady=(0, 10), sticky="n")

        # page indicator
        self.dots_label = ctk.CTkLabel(self, text="", font=("SF Pro Text", 18))
        self.dots_label.grid(row=4, column=0, pady=(5, 20))

        # bottom buttons
        bottom = ctk.CTkFrame(self, fg_color="transparent")
        bottom.grid(row=5, column=0, pady=(10, 30))
        bottom.grid_columnconfigure((0, 1), weight=1)

        self.get_started_btn = ctk.CTkButton(
            bottom,
            text="Get started",
            command=self.next_slide,
            width=140,
            height=40,
            fg_color="#7A2BCB",
            hover_color="#6923AE",
            text_color="white",
            corner_radius=20,
        )
        self.get_started_btn.grid(row=0, column=0, padx=10)

        self.login_btn = ctk.CTkButton(
            bottom,
            text="Log In",
            command=self.on_login,
            width=140,
            height=40,
            fg_color="white",
            hover_color="#F2F2F7",
            text_color="#7A2BCB",
            border_width=1,
            border_color="#7A2BCB",
            corner_radius=20,
        )
        self.login_btn.grid(row=0, column=1, padx=10)

        self.show_slide(0)

    def _load_images(self):
        """Загружаем картинки с иллюстрациями (при отсутствии — просто игнор)."""
        for slide in self.slides:
            path = slide.get("image")
            try:
                img = Image.open(path)
                img = img.resize((260, 260), Image.LANCZOS)
                self.images.append(ctk.CTkImage(img, size=(260, 260)))
            except Exception:
                self.images.append(None)

    def show_slide(self, i: int):
        self.index = i
        slide = self.slides[i]

        # illustration
        img = self.images[i]
        if img is not None:
            self.illustration_label.configure(image=img, text="")
        else:
            # заглушка, если нет картинки
            self.illustration_label.configure(
                image=None,
                text="Illustration\nplaceholder",
                font=("SF Pro Text", 14),
                text_color="#7A2BCB",
            )

        # text
        self.title_label.configure(text=slide["title"])
        self.subtitle_label.configure(text=slide["subtitle"])

        # dots
        dots = []
        for idx in range(len(self.slides)):
            dots.append("●" if idx == i else "○")
        self.dots_label.configure(text="  ".join(dots))

        # кнопка “Get started” меняет текст на последнем экране
        if i < len(self.slides) - 1:
            self.get_started_btn.configure(text="Get started")
        else:
            self.get_started_btn.configure(text="Continue")

    def next_slide(self):
        if self.index < len(self.slides) - 1:
            self.show_slide(self.index + 1)
        else:
            print("Continue pressed")  # здесь открыть главное окно / регистрацию

    def on_login(self):
        print("Log In pressed")       # здесь открыть окно логина


if __name__ == "__main__":
    root = ctk.CTk()
    root.title("BrainQuery Onboarding")
    root.geometry("390x844")  # примерно как iPhone 12

    onboarding = Onboarding(root, SLIDES)
    onboarding.pack(expand=True, fill="both")

    root.mainloop()
