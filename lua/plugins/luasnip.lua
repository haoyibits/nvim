return {
    "L3MON4D3/LuaSnip",
    config = function()
        local ls = require("luasnip")
        local s = ls.snippet
        local t = ls.text_node
        local i = ls.insert_node

        require("luasnip.loaders.from_vscode").lazy_load()  -- 兼容 VSCode 片段

        ls.add_snippets("c", {
            s("osinclude", {
                t({
                    "#include <stdio.h>",
                    "#include <stdlib.h>",
                    "#include <unistd.h>",
                    "#include <time.h>",
                    "#include <sys/wait.h>",
                    "#include <sys/types.h>",
                    "#include <sys/ipc.h>",
                    "#include <sys/shm.h>",
                    "#include <sys/stat.h>",
                    "#include <fcntl.h>",
                    "#include <errno.h>",
                    "#include <string.h>",
                    "#include <sys/mman.h>",
                    "#include <semaphore.h>",
                    "#include <pthread.h>",
                    "#include <signal.h>",
                    "#include <sys/msg.h>",
                    ""
                })
            }),
        })
        ls.add_snippets("c", {
            s("osexecvp", {
                t({
                    "char *args[] = {\"ls\", \"-l\", NULL};",
                    "execvp(\"ls\", args);",
                    ""
                })
            }),
        })
        ls.add_snippets("c", {
            s("osthread", {
                t({
                    "void *thread_function(void *arg) {",
                    "   thread_data *data = (thread_data *)arg;",
                    "   // Thread work here",
                    "   pthread_exit(NULL);",
                    "}",
                    "pthread_t thread;",
                    "pthread_create(&thread, NULL, thread_function, &data);",
                    "pthread_join(thread, NULL);",

                    ""
                })
            }),
        })
        ls.add_snippets("c", {
            s("ostypedef", {
                t({
                    "typedef struct {",
                    "    int field1;",
                    "} my_struct_t;",
                    ""
                })
            }),
        })
        ls.add_snippets("c", {
            s("osshm", {
                t({
                    "int shm_id = shmget(IPC_PRIVATE, sizeof(), IPC_CREAT | 0666);",
                    "int *shm_ptr = shmat(shm_id, NULL, 0);",
                    "char *shm_ptr = (char *)shmat(shm_id, NULL, 0);",
                    "sprintf(shm_ptr, \"Hello, World!\");",
                    "shmdt(shm_ptr);",
                    "shmctl(shm_id, IPC_RMID, NULL);",
                    ""
                })
            }),
        })
        ls.add_snippets("c", {
            s("osmsg", {
                t({
                    "typedef struct {",
                    "    long mtype;",
                    "    char mtext[100];",
                    "} mymsg;",
                    "int msg_id = msgget(IPC_PRIVATE, IPC_CREAT | 0666);",
                    "mymsg msg;",
                    "msg.mtype = 1;",
                    "strcpy(msg.mtext, \"Hello, World!\");",
                    "msgsnd(msg_id, &msg, strlen(msg.mtext) + 1, 0);",
                    "msgrcv(msg_id, &msg, sizeof(msg.mtext), 1, 0);",
                    "msgctl(msg_id, IPC_RMID, NULL);",
                    ""
                })
            }),
        })
        ls.add_snippets("c", {
            s("ossigwait", {
                t({
                    "sigset_t set;",
                    "sigemptyset(&set);",
                    "sigaddset(&set, SIGUSR1);",
                    "sigaddset(&set, SIGUSR2);",
                    "sigprocmask(SIG_BLOCK, &set, NULL);",
                    "int sig = 0;",
                    "sigwait(&set, &sig);",
                }),
            }),
        })
        ls.add_snippets("c", {
            s("ospipe", {
                t({
                    "int pipe_fd[2];",
                    "if (pipe(pipe_fd) == -1) {",
                    "    perror(\"pipe\");",
                    "    exit(1);",
                    "}",
                    "close(pipe_fd[0]);// Close read end",
                    "write(pipe_fd[1], &a, sizeof(int));",
                    "close(pipe_fd[1]);// Close write end",
                    "char buffer[100];",
                    "read(pipe_fd[0], buffer, sizeof(buffer));",
                    ""
                })
            }),
        })
        ls.add_snippets("c", {
            s("osfifo", {
                t({
                    "mkfifo(\"my_fifo\", 0666);",
                    "int fd = open(\"my_fifo\", O_WRONLY);",
                    "write(fd, \"Hello, World!\", 13);",
                    "close(fd);",
                    "fd = open(\"my_fifo\", O_RDONLY);",
                    "char buffer[100];",
                    "read(fd, buffer, sizeof(buffer));",
                    "close(fd);",
                    "unlink(\"my_fifo\");// unlink only once",
                    ""
                })
            }),
        })
        ls.add_snippets("c", {
            s("ossigint", {
                t({
                    "void sigint_handler(int signum) {",
                    "    // Handle SIGINT here",
                    "}",
                    "signal(SIGINT, sigint_handler);",
                    ""
                })
            }),
        })
        ls.add_snippets("c", {
            s("ossigalarm", {
                t({
                    "void sigalrm_handler(int signum) {",
                    "    // Handle SIGALRM here",
                    "}",
                    "signal(SIGALRM, sigalrm_handler);",
                    "alarm(5); // Set alarm for 5 seconds",
                    "pause(); // Wait for signal",
                    ""
                })
            }),
        })
        ls.add_snippets("c", {
            s("ossigusr", {
                t({
                    "void sigusr1_handler(int signum) {",
                    "    // Handle SIGUSR1 here",
                    "}",
                    "signal(SIGUSR1, sigusr1_handler);",
                    "kill(getppid(), SIGUSR1);",
                    ""
                })
            }),
        })
        ls.add_snippets("c", {
            s("ossemthread", {
                t({
                    "sem_t sem;",
                    "sem_init(&sem, 0, 0);",
                    "sem_wait(&sem);",
                    "sem_post(&sem);",
                    "sem_destroy(&sem);",
                    ""
                })
            }),
        })
        ls.add_snippets("c", {
            s("ossemprocess", {
                t({
                    "sem_t *sem = mmap(NULL, sizeof(sem_t), PROT_READ | PROT_WRITE, MAP_SHARED| MAP_ANONYMOUS, -1, 0);",
                    "sem_init(sem, 1, 0);",
                    "sem_wait(sem);",
                    "sem_post(sem);",
                    "sem_destroy(sem);",
                    "munmap(sem, sizeof(sem_t));",
                    ""
                })
            }),
        })
        ls.add_snippets("c", {
            s("osthreadmutexcond", {
                t({
                    "pthread_mutex_t mutex;",
                    "pthread_cond_t cond;",
                    "",
                    "// Thread function",
                    "void *thread_function(void *arg) {",
                    "    pthread_mutex_lock(&mutex);",
                    "    // Wait for condition",
                    "    pthread_cond_wait(&cond, &mutex);",
                    "    // Do work after condition is signaled",
                    "    pthread_mutex_unlock(&mutex);",
                    "}",
                    "",
                    "// Signal condition from another thread",
                    "pthread_mutex_lock(&mutex);",
                    "pthread_cond_signal(&cond);",
                    "pthread_mutex_unlock(&mutex);",
                    "",
                    "pthread_t thread;",
                    "pthread_mutex_init(&mutex, NULL);",
                    "pthread_cond_init(&cond, NULL);",
                    "pthread_create(&thread, NULL, thread_function, NULL);",
                    "pthread_join(thread, NULL);",
                    "pthread_mutex_destroy(&mutex);",
                    "pthread_cond_destroy(&cond);",
                    ""
                })
            }),
        })
        ls.add_snippets("c", {
            s("kmodplan", {
                t({
                    "// Kernel Module Plan: Memory-Mapped Device with ioctl Interface",
                    "//",
                    "// [General Logic]",
                    "// - Define hardware base address and register layout.",
                    "// - Implement ioctl with copy_from_user() to receive user config.",
                    "// - Encode config into register format; use iowrite32() to apply.",
                    "// - Setup file_operations with unlocked_ioctl().",
                    "//",
                    "// [init() Function Steps]",
                    "// - Register a major number using register_chrdev().",
                    "// - Create device class with class_create().",
                    "// - Create device node with device_create().",
                    "// - Check IS_ERR(), destroy and unregister, return PTR_ERR().",
                    "// - ioremap() hardware memory region.",
                    "// - Handle errors with cleanup: destroy device/class, unregister.",
                    "// - Return 0 if success, or error code on failure.",
                    "//",
                    "// [exit() Function]",
                    "// - Unmap memory with iounmap().",
                    "// - Destroy device and class.",
                    "// - Unregister character device.",
                    ""
                })
            }),
        })
        ls.add_snippets("c", {
            s("oskernelinclude", {
                t({
                    "#include <linux/atomic.h>",
                    "#include <linux/cdev.h>",
                    "#include <linux/delay.h>",
                    "#include <linux/device.h>",
                    "#include <linux/fs.h>",
                    "#include <linux/init.h>",
                    "#include <linux/io.h>",
                    "#include <linux/module.h>",
                    "#include <linux/printk.h>",
                    "#include <linux/types.h>",
                    "#include <linux/uaccess.h>",
                    "#include <linux/version.h>",
                    ""
                })
            }),
        })
        ls.add_snippets("all", {
        -- 头文件部分
        s("ioctlh", {
            t({
            "#ifndef DEVICE_IOCTL_H",
            "#define DEVICE_IOCTL_H",
            "",
            "#include <linux/ioctl.h>",
            "",
            "#define IOCTL_MAGIC 'X'",
            "",
            "//#define IOCTL_CMD_1 _IOW(IOCTL_MAGIC, 1, int)",
            "//#define IOCTL_CMD_2 _IOW(IOCTL_MAGIC, 2, int)",
            "#define IOCTL_CONFIG _IOW(IOCTL_MAGIC, 0, struct device_config)",
            "",
            "struct device_config {",
            "    uint8_t enable;",
            "    uint8_t mode;",
            "    uint8_t level;",  -- 保留字段以对齐结构体
            "    uint8_t option;",
            "};",
            "#endif // DEVICE_IOCTL_H",
            ""
            })
        }),

        -- 声明和模块元信息部分
        s("ioctldef", {
            t({
            "#include <linux/module.h>",
            "#include <linux/fs.h>",
            "#include <linux/uaccess.h>",
            "#include <linux/cdev.h>",
            "#include <linux/device.h>",
            "#include <linux/io.h>",
            "#include \"device_ioctl.h\"",
            "",
            "#define DEVICE_NAME      \"mydevice\"",
            "#define CLASS_NAME       \"myclass\"",
            "#define DEVICE_BASE      0xDEADBEEF",
            "#define DEVICE_REG_SIZE  4",
            "",
            "static void __iomem *ctrl_reg;",
            "static int major_number;",
            "static struct class*  dev_class = NULL;",
            "static struct device* dev_device = NULL;",
            "",
            "module_init(dev_init);",
            "module_exit(dev_exit);",
            "",
            "MODULE_LICENSE(\"GPL\");",
            "MODULE_AUTHOR(\"Haoyi Chen\");",
            "MODULE_DESCRIPTION(\"kernel module\");",
            ""
            })
        }),

        -- ioctl 实现部分
        s("ioctldev", {
            t({
                "static long dev_ioctl(struct file *file, unsigned int cmd, unsigned long arg)",
                "{",
                "    struct device_config cfg;",
                "    u32 reg_value = 0;",
                "",
                "    // Check if the ioctl command is supported",
                "    if (cmd != DEVICE_IOCTL_CONFIG)",
                "        return -EINVAL;",
                "",
                "    // Safely copy the config structure from userspace",
                "    if (copy_from_user(&cfg, (void __user *)arg, sizeof(cfg)))",
                "        return -EFAULT;",
                "",
                "    // Validate input fields based on device constraints",
                "    if (cfg.enable > 1 || cfg.mode > 3 || cfg.level > 15 || cfg.option > 1)",
                "        return -EINVAL;",
                "",
                "    // Encode the configuration into the register value",
                "    reg_value |= (cfg.enable & 0x1) << 0;",
                "    reg_value |= (cfg.mode   & 0x3) << 1;",
                "    reg_value |= (cfg.level  & 0xF) << 3;",
                "    reg_value |= (cfg.option & 0x1) << 7;",
                "",
                "    // Write the value to the memory-mapped hardware register",
                "    iowrite32(reg_value, ctrl_reg);",
                "",
                "    return 0;",
                "}",
                ""
            })
        }),

        -- file_operations 部分
        s("ioctlfops", {
            t({
            "static const struct file_operations fops = {",
            "    .owner = THIS_MODULE,",
            "    .unlocked_ioctl = dev_ioctl,",
            "};",
            ""
            })
        }),

        -- init 部分
        s("ioctlinit", {
            t({
            "static int __init dev_init(void)",
            "{",
            "    major_number = register_chrdev(0, DEVICE_NAME, &fops);",
            "    if (major_number < 0) {",
            "        pr_err(\"Failed\\n\");",
            "        return major_number;",
            "    }",
            "",
            "    dev_class = class_create(THIS_MODULE, CLASS_NAME);",
            "    if (IS_ERR(dev_class)) {",
            "        unregister_chrdev(major_number, DEVICE_NAME);",
            "        return PTR_ERR(dev_class);",
            "    }",
            "",
            "    dev_device = device_create(dev_class, NULL, MKDEV(major_number, 0), NULL, DEVICE_NAME);",
            "    if (IS_ERR(dev_device)) {",
            "        class_destroy(dev_class);",
            "        unregister_chrdev(major_number, DEVICE_NAME);",
            "        return PTR_ERR(dev_device);",
            "    }",
            "",
            "    ctrl_reg = ioremap(DEVICE_BASE, DEVICE_REG_SIZE);",
            "    if (!ctrl_reg) {",
            "        device_destroy(dev_class, MKDEV(major_number, 0));",
            "        class_destroy(dev_class);",
            "        unregister_chrdev(major_number, DEVICE_NAME);",
            "        return -ENOMEM;",
            "    }",
            "",
            "    pr_info(\"device loaded successfully\\n\");",
            "    return 0;",
            "}",
            ""
            })
        }),

        -- exit 部分
        s("ioctlexit", {
            t({
            "static void __exit dev_exit(void)",
            "{",
            "    iounmap(ctrl_reg);",
            "    device_destroy(dev_class, MKDEV(major_number, 0));",
            "    class_destroy(dev_class);",
            "    unregister_chrdev(major_number, DEVICE_NAME);",
            "    pr_info(\"device unloaded\\n\");",
            "}",
            ""
            })
        })
        })
        ls.add_snippets("c", {
            s("threadplan", {
                t({
                    "// Parse inputs (e.g., array size, thread count).",
                    "// Allocate data and thread info structs.",
                    "// Divide work among threads (start/end indices).",
                    "// Create threads with pthread_create().",
                    "// Each thread does its chunk of work.",
                    "// Join threads with pthread_join().",
                    "// Combine partial results if needed.",
                    "// Free memory and exit.",
                    ""
                })
            }),
        })
        ls.add_snippets("c", {
            s("procsemplan", {
                t({
                    " // Use mmap() to share unnamed semaphores.",
                    " // sem_init() with value 0 to block dependent steps.",
                    " // fork() to create processes A, B, C.",
                    " // Use sem_post/sem_wait to enforce execution order.",
                    " // Parent waits and then cleans up.",
                    ""
                })
            }),
        })
        ls.add_snippets("make", {
            s("ioctlmake", {
                t({
                    "obj-m += my_module.o",
                    "",
                    "KDIR := /lib/modules/$(shell uname -r)/build",
                    "PWD  := $(shell pwd)",
                    "",
                    "all:",
                    "\tmake -C $(KDIR) M=$(PWD) modules",
                    "",
                    "clean:",
                    "\trm -f *.o *.ko *.mod.* *.symvers *.order",
                    ""
                })
            }),
        })
        ls.add_snippets("c", {
            s("osmain", {
                t({
                    "int main(int argc, char *argv[])",
                    "{",
                    "\t"
                }),
                i(1), -- Insert node where the cursor will be placed
                t({
                    "",
                    "\treturn 0;",
                    "}"
                })
            }),
        })
    end,
    dependencies = { "rafamadriz/friendly-snippets" },
}