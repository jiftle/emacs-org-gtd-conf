;; --------------------------------------
;; 文件名: orgconf.el
;; 功能描述: 配置Org-Mode模式
;; 作者: jiftle
;; 时间: 2019-12-30
;; --------------------------------------

;; 定义变量
(defvar org-agenda-dir "" "gtd org files location")

;; ----------- 配置Org-Mode的存储目录 --------------
(setq org-agenda-files '("~/note/orgnotes"))
(setq-default org-agenda-dir "~/note/orgnotes/")

;; ------------ 配置org agenda 日程 --------------
(global-set-key (kbd "C-c a") 'org-agenda)

;; -------------- 配置org -----------------
(global-set-key (kbd "C-c c") 'org-capture)

(setq org-agenda-file-inbox (expand-file-name "inbox.org" org-agenda-dir))
(setq org-agenda-file-task (expand-file-name "task.org" org-agenda-dir))
(setq org-agenda-file-finished (expand-file-name "finished.org" org-agenda-dir))
(setq org-agenda-file-note (expand-file-name "note.org" org-agenda-dir))
(setq org-agenda-file-trash (expand-file-name "trash.org" org-agenda-dir))
(setq org-agenda-file-project (expand-file-name "project.org" org-agenda-dir))


;;--------------- capture 任务模板 ----------------
(setq org-capture-templates
      '(
        ("1" "Tasks" entry (file+headline org-agenda-file-inbox "Tasks")
         "* TODO [#B] %?\n  %i\n"
         :empty-lines 1)
        ("2" "Ideas" entry (file+headline org-agenda-file-inbox "Ideas")
         "* SOMEDAY [#D] %?\n  %i\n"
         :empty-lines 1)
        ))

;; ------------ 优先级设置颜色 ---------------
(setq org-highest-priority ?A)
(setq org-lowest-priority  ?D)
(setq org-default-priority ?D)
(setq org-priority-faces
      '((?A . (:background "red" :foreground "white" :weight bold))
        (?B . (:background "DarkOrange" :foreground "white" :weight bold))
        (?C . (:background "yellow" :foreground "magenta" :weight bold))
        (?D . (:background "DodgerBlue" :foreground "burlywood" :weight bold))
        ))

;; ------------- 任务状态 -----------------
(setq org-todo-keywords
      '((sequence "TODO(1)" "NEXT(2)" "WAITTING(3)" "SOMEDAY(4)" "|" "DONE(5)" "ABORT(6)")
    ))

;; todo关键字，显示样式配置
(setq org-todo-keyword-faces
	'(	("TODO" . (:background "red" :foreground "white" :weight bold))
		("NEXT" . (:background "white" :foreground "red" :weight bold))
		("WAITTING" . (:foreground "MediumBlue" :weight bold))
		("SOMEDAY" . (:background "purple" :foreground "gray" :weight bold))
		("DONE" . (:background "DarkOrange" :foreground "black" :weight bold))
		("ABORT" . (:background "azure" :foreground "Darkgreen" :weight bold))
))

;; ------------- Tag 标签,在所有的org文件中生效 ------------------
(setq org-tag-alist '(
                      ("工作" . ?1) 
                      ("学习" . ?2)
                      ("生活" . ?3)
                      ("项目" . ?4)
                      )) 

;; --------------- 定义转接文件 --------------
;; 绑定快捷键
(define-key global-map "\C-cr" 'org-refile)


;; 转接文件
(setq org-refile-targets  '(
    (org-agenda-file-task :maxlevel . 1)
    (org-agenda-file-finished :maxlevel . 1)
    (org-agenda-file-note :maxlevel . 1)
    (org-agenda-file-trash :maxlevel . 1)
    (org-agenda-file-project :maxlevel . 1)
))

;; --------------- 显示样式 --------------
;; 打开org-indent mode
(setq org-startup-indented t)

;; 设置bullet list
(setq org-bullets-bullet-list '("☰" "☷" "☯" "☭"))


