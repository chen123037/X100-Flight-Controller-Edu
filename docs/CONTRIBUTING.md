> **最新入口：** [c8状态](../STATUS.md) / [中文评审资料](../hardware/reviews/X100_C8_LAYOUT_REVIEW/)。下文涉及45mm、30.5孔距、零布线或旧正式源的描述属于历史基线，不代表c8；数值规则须结合c8的PRO/DRU和后续裁决。当前仍不可投板。

# 学生协作指南（Contributing）

仓库owner为 **chen123037**。学生/合作开发者可通过GitHub collaborator与pull request参与；owner保留仓库管理及最终技术review权。项目当前为开放教学硬件，许可范围见[开放许可决定](../LICENSE_DECISION.md)。

## main代表什么

`main = CURRENT HUMAN-ACCEPTED BASELINE`，即当前人工接受的基线，**不等于已可制造或飞行**。当前仍PRE-ROUTING、NOT FABRICATION READY、NOT FLIGHT VALIDATED，原理图/placement冻结，正式tracks/vias/zones=0。

不得把TEST_ONLY、failed candidate、temporary search或unfinished experiment直接提交到main。候选工程、搜索结果和临时实验保留在工作分支/本地，不用来覆盖正式接受版本。

## 建议工作流程

**branch → commit → pull request / review → merge main**。避免多人同时直接覆盖main；即使collaborator有push权限，正式硬件改变也优先走PR review。

1. 开工前读[STATUS](../STATUS.md)、[HANDOFF](../HANDOFF.md)、[KNOWN_ISSUES](KNOWN_ISSUES.md)和[ROADMAP](ROADMAP.md)，先取得对应阶段/改动范围的人工技术裁决。
2. 从最新main建立任务分支，保持一次PR聚焦一个可审查目标。可用`feature/usb-core-power`、`feature/j601-fix`、`feature/j401-fab-fix`和`pcb03-routing`；分支名本身不构成执行授权。
3. 提交可复核的源改动和必要说明；保留原Reference/MPN/Net/库标识，避免导入私人聊天、凭证、本机绝对路径、缓存、执行日志和未接受候选。
4. PR说明写清问题、授权范围、改动、fresh ERC/DRC/netlist/readback、几何/电源安全证据及未通过项。文档改动核对链接与硬件不变；硬件改动按批准阶段验证。
5. 由owner/技术review确认后合并main；不要以ERC0/0或已有placement代替功能、制造、台架或飞行验证。

以下改动尤其应PR review：schematic ECO、component MPN、power architecture、MCU pin mapping、mounting geometry、PCB stackup、USB power architecture和manufacturing release。实际PCB编辑遵守[HANDOFF中的执行角色](../HANDOFF.md)，不因脚本方便绕过正式执行器或冻结边界。

## 当前必须先完成的三项工作

| 工作 | 当前状态 / 进入PCB03之前的条件 |
| --- | --- |
| USB_ONLY_CORE_POWER_ECO | 当前NOT_IMPLEMENTED，V1 REQUIRED；先单独裁决供电域、电流预算、反向阻断/双源安全及最小ECO |
| J601 manufacturability closure | 3条真实制造阻塞；局部器件释放和工程重排需人工裁决，不动安装孔或扩大45mm板框 |
| J401 fabrication geometry closure | 4条逻辑报告对应2处约0.1944mm孔铜几何；先取得板厂对exact官方land的明确接受 |

三项完成、fresh检查通过并经人工确认`ROUTING_PRECONDITIONS_MET=YES`后，还需明确PCB03 FORMAL ROUTING授权才开始布线。不能靠全局放宽clearance或排除整个接口制造PASS，不自动恢复当前暂停的硬件工作。

## 如何邀请学生

由owner先取得学生GitHub账号，再到 **GitHub → 本仓库 → Settings → Collaborators → Add people** 邀请。对方接受后获得个人仓库的正常pull/push协作能力；实际硬件开发仍采用PR与人工技术review。本次发布不自动邀请账号，也没有设置分支保护或修改仓库设置。

官方操作说明：[邀请个人仓库协作者](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/repository-access-and-collaboration/inviting-collaborators-to-a-personal-repository)。协作者写入权限与本项目建议的PR流程是两件事，不将文档建议冒充已启用的GitHub强制保护。
