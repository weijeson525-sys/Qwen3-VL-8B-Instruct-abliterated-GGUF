# Qwen3-VL-8B-Instruct-abliterated-GGUF — 公开资料镜像

> 这是 Hugging Face 仓库的公开资料镜像（模型卡 + 小文件 + 下载脚本），**不含权重文件**。

- 来源 HF 仓库：https://huggingface.co/mradermacher/Qwen3-VL-8B-Instruct-abliterated-GGUF
- 榜单来源：AI探路者Tim X 帖 https://x.com/aiexplorertim/status/2118947309992260083（“全球下载量最高的 10 个无审查 AI 模型”）
- 核实日期：2026-11-09；模型卡抓取日期：2026-11-10
- 许可证：Apache-2.0（许可证备注：Apache-2.0，HF cardData 核实；基底 prithivMLmods/Qwen3-VL-8B-Instruct-abliterated-v1）
- 门控状态：gated=false（HF 仓库本身不门控，可匿名下载，无须令牌）
- 权重文件不在本仓库：GitHub 单文件上限 100MB，本仓库最小量化也要几 GB（首选量化 Q4_K_M 5.03GB），放不下；用本仓库的 `download.sh` 从 HF 拉取。

## 量化与下载

- 首选量化：**Q4_K_M，5.03GB**（`Qwen3-VL-8B-Instruct-abliterated.Q4_K_M.gguf`，5,027,785,792 字节）
- 备用量化：Q2_K 3.28GB、Q3_K_S 3.77GB、IQ4_XS 4.59GB、Q4_K_S 4.80GB、Q5_K_M 5.85GB、Q8_0 8.71GB
- 另有 mmproj（可选，视觉用）：mmproj Q8_0 0.75GB、mmproj f16 1.16GB（`./download.sh --mmproj` 另行下载）
- 下载方法：`./download.sh`（默认首选量化 Q4_K_M）；`./download.sh [量化名]` 可改下别的量化；`./download.sh --list` 列出全部可用量化与大小；`./download.sh --mmproj` 另下 mmproj。下载后逐个核对字节数与 sha256（LFS oid）。

### 全部 GGUF 文件（HF 文件树实测，仅作下载清单，本仓库不含这些文件）

| 文件 | 字节数 | 大小 | sha256（LFS oid） |
|---|---|---|---|
| `Qwen3-VL-8B-Instruct-abliterated.Q4_K_M.gguf` | 5,027,785,792 | 5.03 GB | `713d7cfeb8e1eccb3c92838c26d3fc5c99d238ce161caa3b3d5e3133ec491f42` |
| `Qwen3-VL-8B-Instruct-abliterated.Q2_K.gguf` | 3,281,734,720 | 3.28 GB | `af7e99bb61ea2a0dfd0f828088b3b20b7d08315242e94b2ddc020a5c89c55f28` |
| `Qwen3-VL-8B-Instruct-abliterated.Q3_K_S.gguf` | 3,769,613,376 | 3.77 GB | `aa5f9aa07aaa5f5ab7e6e27a2bfb4847f2e8626e19a96a99d5aa74e93b8540d3` |
| `Qwen3-VL-8B-Instruct-abliterated.IQ4_XS.gguf` | 4,593,298,496 | 4.59 GB | `615420502b47d014363650ef29812fb199a61e3970d754ddd3820d292f2b5bd2` |
| `Qwen3-VL-8B-Instruct-abliterated.Q4_K_S.gguf` | 4,802,014,272 | 4.80 GB | `2960e95966d84237173d4744de4cbcb420bf4f5cabf05bf56bf53901fe47ce2c` |
| `Qwen3-VL-8B-Instruct-abliterated.Q5_K_M.gguf` | 5,851,114,560 | 5.85 GB | `6bead04b1b589e3cee4bc9dbc2e4a4c07fa5e38cb3212a4020d8e7e55d7423ca` |
| `Qwen3-VL-8B-Instruct-abliterated.Q8_0.gguf` | 8,709,520,448 | 8.71 GB | `58c5b9afa8f873b35574ddb0d51c2a87151309aa745843d0a89951d24f663f12` |
| `Qwen3-VL-8B-Instruct-abliterated.Q3_K_L.gguf` | 4,431,395,904 | 4.43 GB | `4a8e52ceaefe9946d8c83bc4e064a568dac0b3365f1ad84b01739b950449d6ea` |
| `Qwen3-VL-8B-Instruct-abliterated.Q3_K_M.gguf` | 4,124,163,136 | 4.12 GB | `126516df4ab91b5a33f8a12258f777f6e1042157a4c741d823d14b144263e5d0` |
| `Qwen3-VL-8B-Instruct-abliterated.Q5_K_S.gguf` | 5,720,763,456 | 5.72 GB | `d55a7f428c601a1611e9ebe66cbed99eb8cb38b6ac5a33e35d35ea11efbf8e82` |
| `Qwen3-VL-8B-Instruct-abliterated.Q6_K.gguf` | 6,725,901,376 | 6.73 GB | `ccca1cd47d48c6e596b56eb0f17f3a94613aa25a251adc6b127d7cfb063eab16` |
| `Qwen3-VL-8B-Instruct-abliterated.f16.gguf` | 16,388,045,888 | 16.39 GB | `b5f2adaa3e7f3595987dafa5f224491e7c7e81c71008ecb718adc6dd72666755` |

### mmproj 文件（可选，视觉用）

| 文件 | 字节数 | 大小 | sha256（LFS oid） |
|---|---|---|---|
| `Qwen3-VL-8B-Instruct-abliterated.mmproj-Q8_0.gguf` | 752,290,240 | 0.75 GB | `b0dddc620b652dbd285538d840d1d5b6d196758257cbd89e54ad291b80a569f9` |
| `Qwen3-VL-8B-Instruct-abliterated.mmproj-f16.gguf` | 1,159,030,336 | 1.16 GB | `fe1a01686420659ecfc442347ea8d07ab43e2eaafc9c9e709910a73d992b99b2` |

---

下面是 HF 原仓库模型卡原文（开头的 YAML frontmatter 已去掉，其余逐字照录）。

---

## About

<!-- ### quantize_version: 2 -->
<!-- ### output_tensor_quantised: 1 -->
<!-- ### convert_type: hf -->
<!-- ### vocab_type:  -->
<!-- ### tags:  -->
<!-- ### quants:  x-f16 Q4_K_S Q2_K Q8_0 Q6_K Q3_K_M Q3_K_S Q3_K_L Q4_K_M Q5_K_S Q5_K_M IQ4_XS -->
<!-- ### quants_skip:  -->
<!-- ### skip_mmproj:  -->
static quants of https://huggingface.co/prithivMLmods/Qwen3-VL-8B-Instruct-abliterated-v1

<!-- provided-files -->

***For a convenient overview and download list, visit our [model page for this model](https://hf.tst.eu/model#Qwen3-VL-8B-Instruct-abliterated-GGUF).***

weighted/imatrix quants are available at https://huggingface.co/mradermacher/Qwen3-VL-8B-Instruct-abliterated-i1-GGUF
## Usage

If you are unsure how to use GGUF files, refer to one of [TheBloke's
READMEs](https://huggingface.co/TheBloke/KafkaLM-70B-German-V0.1-GGUF) for
more details, including on how to concatenate multi-part files.

## Provided Quants

(sorted by size, not necessarily quality. IQ-quants are often preferable over similar sized non-IQ quants)

| Link | Type | Size/GB | Notes |
|:-----|:-----|--------:|:------|
| [GGUF](https://huggingface.co/mradermacher/Qwen3-VL-8B-Instruct-abliterated-GGUF/resolve/main/Qwen3-VL-8B-Instruct-abliterated.mmproj-Q8_0.gguf) | mmproj-Q8_0 | 0.9 | multi-modal supplement |
| [GGUF](https://huggingface.co/mradermacher/Qwen3-VL-8B-Instruct-abliterated-GGUF/resolve/main/Qwen3-VL-8B-Instruct-abliterated.mmproj-f16.gguf) | mmproj-f16 | 1.3 | multi-modal supplement |
| [GGUF](https://huggingface.co/mradermacher/Qwen3-VL-8B-Instruct-abliterated-GGUF/resolve/main/Qwen3-VL-8B-Instruct-abliterated.Q2_K.gguf) | Q2_K | 3.4 |  |
| [GGUF](https://huggingface.co/mradermacher/Qwen3-VL-8B-Instruct-abliterated-GGUF/resolve/main/Qwen3-VL-8B-Instruct-abliterated.Q3_K_S.gguf) | Q3_K_S | 3.9 |  |
| [GGUF](https://huggingface.co/mradermacher/Qwen3-VL-8B-Instruct-abliterated-GGUF/resolve/main/Qwen3-VL-8B-Instruct-abliterated.Q3_K_M.gguf) | Q3_K_M | 4.2 | lower quality |
| [GGUF](https://huggingface.co/mradermacher/Qwen3-VL-8B-Instruct-abliterated-GGUF/resolve/main/Qwen3-VL-8B-Instruct-abliterated.Q3_K_L.gguf) | Q3_K_L | 4.5 |  |
| [GGUF](https://huggingface.co/mradermacher/Qwen3-VL-8B-Instruct-abliterated-GGUF/resolve/main/Qwen3-VL-8B-Instruct-abliterated.IQ4_XS.gguf) | IQ4_XS | 4.7 |  |
| [GGUF](https://huggingface.co/mradermacher/Qwen3-VL-8B-Instruct-abliterated-GGUF/resolve/main/Qwen3-VL-8B-Instruct-abliterated.Q4_K_S.gguf) | Q4_K_S | 4.9 | fast, recommended |
| [GGUF](https://huggingface.co/mradermacher/Qwen3-VL-8B-Instruct-abliterated-GGUF/resolve/main/Qwen3-VL-8B-Instruct-abliterated.Q4_K_M.gguf) | Q4_K_M | 5.1 | fast, recommended |
| [GGUF](https://huggingface.co/mradermacher/Qwen3-VL-8B-Instruct-abliterated-GGUF/resolve/main/Qwen3-VL-8B-Instruct-abliterated.Q5_K_S.gguf) | Q5_K_S | 5.8 |  |
| [GGUF](https://huggingface.co/mradermacher/Qwen3-VL-8B-Instruct-abliterated-GGUF/resolve/main/Qwen3-VL-8B-Instruct-abliterated.Q5_K_M.gguf) | Q5_K_M | 6.0 |  |
| [GGUF](https://huggingface.co/mradermacher/Qwen3-VL-8B-Instruct-abliterated-GGUF/resolve/main/Qwen3-VL-8B-Instruct-abliterated.Q6_K.gguf) | Q6_K | 6.8 | very good quality |
| [GGUF](https://huggingface.co/mradermacher/Qwen3-VL-8B-Instruct-abliterated-GGUF/resolve/main/Qwen3-VL-8B-Instruct-abliterated.Q8_0.gguf) | Q8_0 | 8.8 | fast, best quality |
| [GGUF](https://huggingface.co/mradermacher/Qwen3-VL-8B-Instruct-abliterated-GGUF/resolve/main/Qwen3-VL-8B-Instruct-abliterated.f16.gguf) | f16 | 16.5 | 16 bpw, overkill |

Here is a handy graph by ikawrakow comparing some lower-quality quant
types (lower is better):

![image.png](https://www.nethype.de/huggingface_embed/quantpplgraph.png)

And here are Artefact2's thoughts on the matter:
https://gist.github.com/Artefact2/b5f810600771265fc1e39442288e8ec9

## FAQ / Model Request

See https://huggingface.co/mradermacher/model_requests for some answers to
questions you might have and/or if you want some other model quantized.

## Thanks

I thank my company, [nethype GmbH](https://www.nethype.de/), for letting
me use its servers and providing upgrades to my workstation to enable
this work in my free time. Additional thanks to [@nicoboss](https://huggingface.co/nicoboss) for giving me access to his private supercomputer, enabling me to provide many more imatrix quants, at much higher quality, than I would otherwise be able to.

<!-- end -->
