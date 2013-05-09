;最新変更箇所
;不要なタブを削除
(fset 'killtab
[?\M-< ?\C-\M-% tab return return ?! ?\M-< ?\C- ?\M-> ?\M-w ?\M-<])
(global-set-key "\C-c\C-k" 'killtab)
;全選択してコピーのマクロ
(fset 'copy-all
[?\M-< ?\C- ?\M-> ?\M-w ?\M-<])
(global-set-key "\C-c\C-a" 'copy-all)
;gnuserv
;(require 'gnuserv)
;(gnuserv-start)
;(setq gnuserv-frame (selected-frame)) ; 新しいフレームを開かない
;printする
(global-set-key "\C-c\C-p" 'print-buffer)
;print
(setq lpr-command
(expand-file-name (concat exec-directory
"ak2pr.exe")))
(setq lpr-switches '())
(setq lpr-add-switches t)
(setq lpr-command-switches '())
;html-helper-mode
;(autoload 'html-helper-mode "html-helper-mode" "Yay HTML" t) (setq auto-mode-alist ;(cons '("\\.html$" . html-helper-mode) auto-mode-alist))
;他のアプリでtxtファイルを開く際Meadowを使う
;(require 'gnuserv)
;(gnuserv-start)
;(setq gnuserv-frame (selected-frame))
;for Meadow2.10
;ツールバーを表示しない
(tool-bar-mode 0)
;メニューバーを表示しない
(menu-bar-mode 0)
;スクロールバーを表示しない
(set-scroll-bar-mode nil)
;選択範囲を強調表示
(setq-default transient-mark-mode t)
;Modelineのカスタマイズ
;; Encoded-kb はいらない
;(eval-after-load "encoded-kb"
; '(setcar (cdr (assq 'encoded-kbd-mode minor-mode-alist)) "")) ;; Isearch は表示しなくてよい
;(add-hook 'isearch-mode-hook
; '(lambda () (setcar (cdr (assq 'isearch-mode minor-mode-alist)) "")))
;; Texinfo も長い
;(add-hook 'texinfo-mode-hook
; '(lambda ()
; (setq mode-name "Texi")))
;; scratch バッファの Lisp Interaction も長い
(add-hook 'lisp-interaction-mode-hook
'(lambda ()
(setq mode-name "Lisp-Int"))) ;; Emacs-Lisp も長い
(add-hook 'emacs-lisp-mode-hook
'(lambda ()
(setq mode-name "Elisp")))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Windowsの関連付け
(add-hook 'dired-mode-hook
(lambda ()
(define-key dired-mode-map
"z" 'dired-fiber-find)))
(defun dired-fiber-find ()
(interactive)
(let ((file (dired-get-filename)))
(if (file-directory-p file)
(start-process "explorer" "diredfiber" "explorer.exe"
(unix-to-dos-filename file))
(start-process "fiber" "diredfiber" "fiber.exe" file))))
;diredディレクトリの先頭表示
(setq ls-lisp-dirs-first t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;BackUpファイルを作成しない
(setq make-backup-files nil)
;自動セーブ機能しない
(setq auto-save-default nil)
;kill startup-message
(setq inhibit-startup-message t)
;時刻を表示させる
(setq display-time-string-forms
'(month "/" day " " dayname " " 24-hours ":" minutes))
(display-time)
;(setq display-time-string-forms
; '(24-hours ":" minutes))
(setq kill-whole-line t)
(setq next-line-add-newlines nil)
(line-number-mode 1)
;C-hをBackSpace機能にする
(global-set-key "\C-h" 'backward-delete-char-untabify)
;do not blink paren (setq blink-matching-paren nil)
;日本語環境設定
(set-language-environment "Japanese")
;文字コード
(set-terminal-coding-system 'shift_jis)
;(set-terminal-coding-system 'iso-2022-jp)
;(set-terminal-coding-system 'utf16-le)
;;; IMEの設定
;(mw32-ime-initialize)
;(setq default-input-method "MW32-IME")
;(setq-default mw32-ime-mode-line-state-indicator "[--]") (setq mw32-ime-mode-line-state-indicator-list '("[--]" "[♪]" "[--]")) (add-hook 'mw32-ime-on-hook
; (function (lambda () (set-cursor-height 2)))) (add-hook 'mw32-ime-off-hook
; (function (lambda () (set-cursor-height 4))))
;;; 起動時のデフォルトディレクトリをホームに。
(cd "~/")
;(cd "c:/000nakai")
;;; font-lockの設定
;(if window-system
; (progn
; (setq font-lock-support-mode 'lazy-lock-mode)
; (global-font-lock-mode t)))
;; ;;; TrueType フォント設定
;(create-fontset-from-request "my16-fontset"
; '((width . 8)
; (height . 16)
; (fixed . t)
; (italic . nil))
; '((family . "ＭＳ ゴシック")
; (family . "Andale Mono"))) (change-fontset-from-request "my16-fontset"
; '((width . 8)
; (height . 16)
; (fixed . t)
; (weight . 700)
; (italic . nil))
; '((family . "ＭＳ ゴシック")
; (family . "Andale Mono"))
; 1)
;(change-fontset-from-request "my16-fontset"
; '((width . 8)
; (height . 16)
; (fixed . t)
; (italic . nil))
; '((family . "ＭＳ 明朝")
; (family . "Andale Mono"))
; 2)
;(change-fontset-from-request "my16-fontset"
; '((width . 8)
; (height . 16)
; (fixed . t)
; (weight . 700)
; (italic . nil))
; '((family . "ＭＳ 明朝")
; (family . "Andale Mono"))
; 3)
;; ;;; shell の設定
;; ;;; Cygwin の bash を使う場合
(setq explicit-shell-file-name "bash.exe") (setq shell-file-name "sh.exe") (setq shell-command-switch "-c") ;;; argument-editing の設定
;(require 'mw32script)
;(mw32script-init)
;;; coding-system の設定
(add-hook 'shell-mode-hook
(lambda ()
(set-buffer-process-coding-system 'undecided-dos 'sjis-unix)))
; (set-buffer-process-coding-system 'undecided-dos 'iso-2022-jp)))
;;; ^M をとる
(add-hook 'comint-output-filter-functions 'shell-strip-ctrl-m nil t) ;;; shell-modeでの補完 (for drive letter) (setq shell-file-name-chars "~/A-Za-z0-9_^$!#%&{}@'`.,;()-")
;うまく動くか未定
;(setq shell-mode-hook
; (function
; (lambda ()
;; Ctrl-a でプロンプトの前に移動
(local-set-key "\C-a" 'comint-bol-or-process-mark) ;; プロンプトを常に最下部に表示する
(setq comint-scroll-show-maximum-output t) ;; Ctrl-p/Ctrl-nは コマンド履歴
(local-set-key "\C-p" 'comint-previous-input)
(local-set-key "\C-n" 'comint-next-input)
; (define-key shell-mode-map "\C-m" 'shell-send-input)
; (setq comint-scroll-show-maximum-output t)
;; ;;; WindowsNT に付属の CMD.EXE を使う場合。
;(setq explicit-shell-file-name "CMD.EXE") ;(setq shell-file-name "CMD.EXE") ;(setq shell-command-switch "\\/c")

;; ;;; coding-system の設定
;; (modify-coding-system-alist 'process ".*sh\\.exe" 'undecided-dos)
;シェルの色等
;(cond ((eq system-type 'windows-nt)
;; bashの時にはこのようにする
; (setq shell-command-option "-c")
;
; (if (not window-system)
; (progn
;;; 表示色の設定(console mode用)
; (set-screen-color 11 1)
; (set-bold-color 14 1) ; ボールド
; (set-italic-color 14 1); イタリック
;;; 画面の大きさの設定。
; (change-console-size 80 30)
; (clear-console)
; (recenter)
; ))))
;; ;;; browse-url の設定
;; (require 'browse-url)
;; (global-set-key [S-mouse-2] 'browse-url-at-mouse) ; カーソルの設定
;(set-cursor-type 'hairline-caret) ; 縦棒キャレット
;(set-face-foreground 'modeline "springgreen1") ;;モードラインの文字の色
;(set-face-background 'modeline "gray4") ;;モードラインの背景の色
;; 初期フレームの設定
(setq default-frame-alist
(append (list '(foreground-color . "cyan")
'(background-color . "black")
'(border-color . "gray")
'(mouse-color . "gray")
'(cursor-color . "gray")
; '(font . "my16-fontset"); TrueType
'(width . 70)
'(height . 35)
'(top . 153)
'(left . 180)
)
default-frame-alist)
)
;;;w3mの設定
;(autoload 'w3m "w3m" "Interface for w3m on Emacs." t)
;(autoload 'w3m-find-file "w3m" "w3m interface function for local file." t)
;(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
;(autoload 'w3m-search "w3m-search" "Search QUERY using SEARCH-ENGINE." t)
;(autoload 'w3m-weather "w3m-weather" "Display weather report." t)
;(autoload 'w3m-antenna "w3m-antenna" "Report chenge of WEB sites." t) ; proxy の設定
;(setq w3m-async-exec nil)
;(setq w3m-command-arguments
; '("-o" "http_proxy=http://172.20.56.17:8080/"
; '("-o" "http_proxy=http://172.20.56.17:8888/"
;))
;Misc不明なものあり
;(autoload 'w3m-browse-url "w3m" "Interface for w3m on Emacs." t)
;(autoload 'w3m-search "w3m-search" "*Search QUERY using SEARCH-ENGINE." t)
;(autoload 'w3m-antenna "w3m-antenna" "*Report chenge of WEB sites." t)
;(autoload 'w3m-antenna-add-current-url "w3m-antenna" "*Add link of current
;page to antenna." t)
;(setq w3m-command "d:/tools/cygwin/usr/local/w3m/bin/w3m.exe")
;(setq w3m-bookmark-file "~/bookmarks.html")
;(setq w3m-home-page "file:///cygdrive/c/000nakai/bookmarks.html")
;(setq w3m-weather-default-area "栃木県・北部")
;(setq w3m-display-inline-image nil)
;(setq w3m-search-default-engine "google-ja") ; new
;(setq w3m-use-form nil)
;;;;;;;;;;;;;;;;;;;;;;;;
;さらに不明
;(cond
; (nil ; for w3m-mnc
; (setq w3m-command "w3m-mnc"
; w3m-mnc t))
; (t ; for w3mmee
; (setq w3m-command "w3mmee"
; w3m-command-arguments '("-o" "concurrent=0" "-F")
; w3m-mnc t
; w3m-w3m-decode-all-to-this-charset 'euc-jp
; w3m-input-coding-system 'euc-japan
; w3m-output-coding-system 'euc-japan
; w3m-w3m-dump-head-source-option "-dump=extra,head,decode"
; w3m-halfdump-extra-options '("-I" "euc-jp" "-o" "concurrent=0")
; w3m-halfdump-option "-dump=half-buffer"
; w3m-coding-system 'euc-japan
; w3m-profile-directory (expand-file-name "~/.w3mmee")
; w3m-default-save-directory (expand-file-name "~/.w3mmee"))
; (setenv "W3MLANG" "ja_JP.eucJP")))
;html-helper-modeの設定
;(autoload 'html-helper-mode "html-helper-mode" "Yay HTML" t) ;(setq auto-mode-alist (cons '("\\.html$" . html-helper-mode) auto-mode-alist)) ;(setq auto-mode-alist (cons '("\\.htm$" . html-helper-mode) auto-mode-alist))
