;; 起動時にeshellを表示する
;;(add-hook 'after-init-hook (lambda() (eshell)(swtch-to-buffer "*eshell*")))

;;スタートアップメニューを表示しない
(setq inhibit-startup-message t)

;; 言語を日本語にする
(set-language-environment 'Japanese)
;; 極力UGF-8とする
(prefer-coding-system 'utf-8)

;; Monaco 12pt をデフォルトにする
(set-face-attribute 'default nil
                    :family "Monaco"
                    :height 120)
;; 日本語をヒラギノ角ゴProNにする
;;(set-fontset-font "fontset-default"
;;                  'japanese-jisx0208
;;                  '("Hiragino Maru Gothic ProN"))
;; 半角カナをヒラギノ角ゴProNにする
;;(set-fontset-font "fontset-default"
;;                  'katakana-jisx0201
;;                  '("Hiragino Maru Gothic ProN"))

;; メニューバーを消す
(menu-bar-mode -1)
;; ツールバーを消す
(tool-bar-mode -1)

;; カレントディレクトリをホームディレクトリに設定
;; ""内は任意のディレクトリを指定可能
(cd "~/")

;; カーソルの点滅を止める
;;(blink-cursor-mode 0)

;; evalした結果を全部表示
;;(setq eval-expression-print-length nil)

;;フレーム透過設定
(set-frame-parameter (selected-frame) 'alpha '(95 80))

;; バックアップファイルを作らない
(setq backup-inhibited t)
;; 終了時にオートセーブファイルを消す
(setq delete-auto-save-files t)

;; スクロールを1行ずつにする
(setq scroll-step 1)
;; スクロール調整
(defun scroll-down-with-lines ()
  "" (interactive) (scroll-down 1))
(defun scroll-up-with-lines ()
  "" (interactive) (scroll-up 1))
(global-set-key [wheel-up] 'scroll-down-with-lines)
(global-set-key [wheel-down] 'scroll-up-with-lines)
(global-set-key [double-wheel-up] 'scroll-down-with-lines)
(global-set-key [double-wheel-down] 'scroll-up-with-lines)
(global-set-key [triple-wheel-up] 'scroll-down-with-lines)
(global-set-key [triple-wheel-down] 'scroll-up-with-lines)

;; 文字の色を設定
(add-to-list 'default-frame-alist '(foreground-color . "white"))
;; 背景色を設定
(add-to-list 'default-frame-alist '(background-color . "gray10"))
;; カーソルの色を設定
(add-to-list 'default-frame-alist '(cursor-color . "PaleGoldenrod"))
;; マウスポインタの色を設定
(add-to-list 'default-frame-alist '(mouse-color . "SlateBlue2"))
;; モードラインの文字の色を設定
(set-face-foreground 'mode-line "white")
;; モードラインの背景色を設定
(set-face-background 'mode-line "MidnightBlue")
;; 選択中のリージョンの色を設定
(set-face-background 'region "LightSteelBlue1")
;; モードライン（アクティブでないバッファ）の文字色を設定
(set-face-foreground 'mode-line-inactive "gray30")
;; モードライン（アクティブでないバッファ）の背景色を設定
(set-face-background 'mode-line-inactive "gray85")

;; プログラムの文字色
;;コメント
(set-face-foreground 'font-lock-comment-face "dim grey")
;; 文字列，ヘッター
(set-face-foreground 'font-lock-string-face  "DeepSkyBlue")
;; while,for
(set-face-foreground 'font-lock-keyword-face "CornflowerBlue")
;; 関数
(set-face-foreground 'font-lock-function-name-face "GreenYellow")
;; 変数
(set-face-foreground 'font-lock-variable-name-face "white")
;; 型
(set-face-foreground 'font-lock-type-face "MediumSpringGreen")
;; include
(set-face-foreground 'font-lock-builtin-face "MediumSpringGreen")
;; goto AのA
(set-face-foreground 'font-lock-constant-face "LightSlateBlue")
(set-face-foreground 'font-lock-warning-face "red")

;; 初期フレームの設定
(setq initial-frame-alist
      (append
       '((top                 . 0)    ;; フレームの Y 位置(ピクセル数)
	 (left                . 0)   ;; フレームの X 位置(ピクセル数)
	 (width               . 85)    ;; フレーム幅(文字数)
	 (height              . 49))   ;; フレーム高(文字数)
       initial-frame-alist))

;; 新規フレームのデフォルト設定
(setq default-frame-alist
      (append
       '((width               . 85)	;; フレーム幅(文字数)
	 (height              . 47))	;; フレーム高(文字数)
       default-frame-alist))

;; 行数と文字数の表示
(defun count-lines-and-chars ()
  (if mark-active
      (format "%d lines,%d chars "
              (count-lines (region-beginning) (region-end))
              (- (region-end) (region-beginning)))
      ;;(count-lines-region (region-beginning) (region-end))
    ""))
(add-to-list 'default-mode-line-format
             '(:eval (count-lines-and-chars)))

;; 画面分割してもデフォルトで折り返す
(setq truncate-partial-width-windows nil)

;; 行番号,桁番号を表示
(line-number-mode t)
;; 起動時に行数表示
(require 'linum)
(global-linum-mode)
(setq column-number-mode t)

;; マウスで選択するとコピーする Emacs 24 ではデフォルトが nil
(setq mouse-drag-copy-region t)

;; 選択範囲の情報表示
(defun count-lines-and-chars ()
  (if mark-active
      (format "(chars:%4d) "
              (- (region-end) (region-beginning)))
    ""))
(add-to-list 'default-mode-line-format
             '(:eval (count-lines-and-chars)))

;; 新規ウィンドウを開かないようにする
(setq ns-pop-up-frames nil)

;; タブ・全角スペース・行末スペースを可視化
(defface my-face-b-1 '((t (:background "SteelBlue"))) nil) ;; 全角スペース
(defface my-face-b-2 '((t (:background "gray10"))) nil) ;; タブ
(defface my-face-u-1 '((t (:background "NavajoWhite4" :underline t))) nil) ;; 行末空白
(defvar my-face-b-1 'my-face-b-1)
(defvar my-face-b-2 'my-face-b-2)
(defvar my-face-u-1 'my-face-u-1)

(defadvice font-lock-mode (before my-font-lock-mode ())
  (font-lock-add-keywords
   major-mode
   '(("\t" 0 my-face-b-2 append)
     ("　" 0 my-face-b-1 append)
     ("[ \t]+$" 0 my-face-u-1 append)
     )))
(ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
(ad-activate 'font-lock-mode)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(safe-local-variable-values (quote ((encoding . utf-8)))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )


;; Ctrl-x p で逆向きへのウィンドウ移動
(global-set-key "\C-xp" (lambda () (interactive) (other-window -1)))

;; eshellでのバッファのクリア
(defun eshell/clear ()
  "clear the eshell buffer."
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))

;; C-x b でバッファの内容を表示しながら、バッファを切り替える
;; C-s,C-rで補完候補を選択
(iswitchb-mode 1)
(defadvice iswitchb-exhibit
  (after
   iswitchb-exhibit-with-display-buffer
   activate)
  (when (and
         (eq iswitchb-method iswitchb-default-method)
         iswitchb-matches)
    (select-window
     (get-buffer-window (cadr (buffer-list))))
    (let ((iswitchb-method 'samewindow))
      (iswitchb-visit-buffer
       (get-buffer (car iswitchb-matches))))
    (select-window (minibuffer-window))))

;;hjklで画面サイズの変更
(defun window-resizer ()
  "Control window size and position."
  (interactive)
  (let ((window-obj (selected-window))
        (current-width (window-width))
        (current-height (window-height))
        (dx (if (= (nth 0 (window-edges)) 0) 1
              -1))
        (dy (if (= (nth 1 (window-edges)) 0) 1
              -1))
        c)
    (catch 'end-flag
      (while t
        (message "size[%dx%d]"
                 (window-width) (window-height))
        (setq c (read-char))
        (cond ((= c ?l)
               (enlarge-window-horizontally dx))
              ((= c ?h)
               (shrink-window-horizontally dx))
              ((= c ?j)
               (enlarge-window dy))
              ((= c ?k)
               (shrink-window dy))
              ;; otherwise
              (t
               (message "Quit")
               (throw 'end-flag t)))))))
(global-set-key "\C-c\C-r" 'window-resizer)

;; 括弧のハイライト
(show-paren-mode t)

;; M-g で指定行へジャンプ
(global-set-key "\M-g" 'goto-line)

;; scratchを消さないようにする
(defun my-make-scratch (&optional arg)
  (interactive)
  (progn
    ;; "*scratch*" を作成して buffer-list に放り込む
    (set-buffer (get-buffer-create "*scratch*"))
    (funcall initial-major-mode)
    (erase-buffer)
    (when (and initial-scratch-message (not inhibit-startup-message))
      (insert initial-scratch-message))
    (or arg (progn (setq arg 0)
                   (switch-to-buffer "*scratch*")))
    (cond ((= arg 0) (message "*scratch* is cleared up."))
          ((= arg 1) (message "another *scratch* is created")))))

(add-hook 'kill-buffer-query-functions
          ;; *scratch* バッファで kill-buffer したら内容を消去するだけにする
          (lambda ()
            (if (string= "*scratch*" (buffer-name))
                (progn (my-make-scratch 0) nil)
              t)))

(add-hook 'after-save-hook
          ;; *scratch* バッファの内容を保存したら *scratch* バッファを新しく作る
          (lambda ()
            (unless (member (get-buffer "*scratch*") (buffer-list))
              (my-make-scratch 1))))

;; スクラッチのメッセージを非表示
(setq initial-scratch-message "")

;; ibufferがデフォルトで起動するようにする
(global-set-key "\C-x\C-b" 'ibuffer)
