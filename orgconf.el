;; ------------ 配置org agenda 日程 --------------
(setq org-agenda-files '("~/orgnotes"))
(global-set-key (kbd "C-c a") 'org-agenda)

;; -------------- 配置org -----------------
(global-set-key (kbd "C-c c") 'org-capture)

;; 这边就是为路径赋值
(defvar org-agenda-dir "" "gtd org files location")
(setq-default org-agenda-dir "~/orgnotes/")
(setq org-agenda-file-inbox (expand-file-name "inbox.org" org-agenda-dir))
(setq org-agenda-file-task (expand-file-name "task.org" org-agenda-dir))
(setq org-agenda-file-finished (expand-file-name "finished.org" org-agenda-dir))
(setq org-agenda-file-trash (expand-file-name "trash.org" org-agenda-dir))


;;--------------- capture 任务模板 ----------------
(setq org-capture-templates
      '(
        ("1" "Inbox" entry (file+headline org-agenda-file-inbox "Inbox")
         "* TODO [#B] %?\n  %i\n"
         :empty-lines 1)
        )
      )
;; ------------ 优先级设置颜色 ---------------
(setq org-highest-priority ?A)
(setq org-lowest-priority  ?D)
(setq org-default-priority ?D)
(setq org-priority-faces
      '((?A . (:background "red" :foreground "white" :weight bold))
        (?B . (:background "DarkOrange" :foreground "white" :weight bold))
        (?C . (:background "yellow" :foreground "DarkGreen" :weight bold))
        (?D . (:background "DodgerBlue" :foreground "black" :weight bold))
        ))

;; ------------- 任务状态 -----------------
(setq org-todo-keywords
      '((sequence "TODO(1)" "NEXT(2)" "WAITTING(3)" "SOMEDAY(4)" "|" "DONE(5)" "ABORT(6)")
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


;; 添加finished和canceled两个文件路径，并且只转移到一级标题
(setq org-refile-targets  '((org-agenda-file-finished :maxlevel . 1)
                             (org-agenda-file-trash :maxlevel . 1)
                             ))

;; --------------- 显示样式 --------------
;; 打开org-indent mode
(setq org-startup-indented t)

;; 设置bullet list
(setq org-bullets-bullet-list '("☰" "☷" "☯" "☭"))



