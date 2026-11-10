#!/usr/bin/env bash
# Download GGUF weights for this model from Hugging Face.
# This repository contains only the model card, small files and this script;
# weights are NOT included (GitHub single-file limit is 100 MB).
# No token, no credentials: the HF repo is public (gated=false).
set -euo pipefail
HF_REPO="mradermacher/Qwen3-VL-8B-Instruct-abliterated-GGUF"
BASE="https://huggingface.co/$HF_REPO/resolve/main"

usage() {
  echo "Usage:"
  echo "  ./download.sh                # default: Q4_K_M"
  echo "  ./download.sh [QUANT]      # download another quant, e.g. ./download.sh Q4_K_S"
  echo "  ./download.sh --list       # list all available quants and sizes"
  echo "  ./download.sh --mmproj [NAME]  # download mmproj file (default: first mmproj listed)"
  echo ""
  echo "Available quants:"
  echo "  Q2_K  (3.28 GB, 1 file(s))"
  echo "  Q3_K_L  (4.43 GB, 1 file(s))"
  echo "  Q3_K_M  (4.12 GB, 1 file(s))"
  echo "  Q3_K_S  (3.77 GB, 1 file(s))"
  echo "  Q4_K_M  (5.03 GB, 1 file(s))"
  echo "  Q4_K_S  (4.80 GB, 1 file(s))"
  echo "  Q5_K_M  (5.85 GB, 1 file(s))"
  echo "  Q5_K_S  (5.72 GB, 1 file(s))"
  echo "  Q6_K  (6.73 GB, 1 file(s))"
  echo "  Q8_0  (8.71 GB, 1 file(s))"
  echo "  IQ4_XS  (4.59 GB, 1 file(s))"
  echo "  f16  (16.39 GB, 1 file(s))"
}

list_quants() {
  echo "Available quants (from HF file tree; files are NOT in this repo):"
  echo "  Q2_K: 3.28 GB (3281734720 bytes)"
  echo "    Qwen3-VL-8B-Instruct-abliterated.Q2_K.gguf  3281734720 bytes"
  echo "  Q3_K_L: 4.43 GB (4431395904 bytes)"
  echo "    Qwen3-VL-8B-Instruct-abliterated.Q3_K_L.gguf  4431395904 bytes"
  echo "  Q3_K_M: 4.12 GB (4124163136 bytes)"
  echo "    Qwen3-VL-8B-Instruct-abliterated.Q3_K_M.gguf  4124163136 bytes"
  echo "  Q3_K_S: 3.77 GB (3769613376 bytes)"
  echo "    Qwen3-VL-8B-Instruct-abliterated.Q3_K_S.gguf  3769613376 bytes"
  echo "  Q4_K_M: 5.03 GB (5027785792 bytes)"
  echo "    Qwen3-VL-8B-Instruct-abliterated.Q4_K_M.gguf  5027785792 bytes"
  echo "  Q4_K_S: 4.80 GB (4802014272 bytes)"
  echo "    Qwen3-VL-8B-Instruct-abliterated.Q4_K_S.gguf  4802014272 bytes"
  echo "  Q5_K_M: 5.85 GB (5851114560 bytes)"
  echo "    Qwen3-VL-8B-Instruct-abliterated.Q5_K_M.gguf  5851114560 bytes"
  echo "  Q5_K_S: 5.72 GB (5720763456 bytes)"
  echo "    Qwen3-VL-8B-Instruct-abliterated.Q5_K_S.gguf  5720763456 bytes"
  echo "  Q6_K: 6.73 GB (6725901376 bytes)"
  echo "    Qwen3-VL-8B-Instruct-abliterated.Q6_K.gguf  6725901376 bytes"
  echo "  Q8_0: 8.71 GB (8709520448 bytes)"
  echo "    Qwen3-VL-8B-Instruct-abliterated.Q8_0.gguf  8709520448 bytes"
  echo "  IQ4_XS: 4.59 GB (4593298496 bytes)"
  echo "    Qwen3-VL-8B-Instruct-abliterated.IQ4_XS.gguf  4593298496 bytes"
  echo "  f16: 16.39 GB (16388045888 bytes)"
  echo "    Qwen3-VL-8B-Instruct-abliterated.f16.gguf  16388045888 bytes"
  echo "  mmproj Q8_0: Qwen3-VL-8B-Instruct-abliterated.mmproj-Q8_0.gguf  752290240 bytes (0.75 GB)"
  echo "  mmproj f16: Qwen3-VL-8B-Instruct-abliterated.mmproj-f16.gguf  1159030336 bytes (1.16 GB)"
}

declare -a FILES=()  # entries: filename|size|sha256
TOTAL=0
QUANT="${1:-Q4_K_M}"

if [ "$QUANT" = "--help" ] || [ "$QUANT" = "-h" ]; then usage; exit 0; fi
if [ "$QUANT" = "--list" ]; then list_quants; exit 0; fi

if [ "$QUANT" = "--mmproj" ]; then
  MMPROJ_NAME="${2:-}"
  case "$MMPROJ_NAME" in
    "Q8_0"|"") FILES=("Qwen3-VL-8B-Instruct-abliterated.mmproj-Q8_0.gguf|752290240|b0dddc620b652dbd285538d840d1d5b6d196758257cbd89e54ad291b80a569f9") ;;
    "f16") FILES=("Qwen3-VL-8B-Instruct-abliterated.mmproj-f16.gguf|1159030336|fe1a01686420659ecfc442347ea8d07ab43e2eaafc9c9e709910a73d992b99b2") ;;
    *) echo "Unknown mmproj: $MMPROJ_NAME (available: Q8_0 f16)" >&2; exit 1 ;;
  esac
  echo "mmproj download selected."
else
  case "$QUANT" in
    "Q2_K") FILES=("Qwen3-VL-8B-Instruct-abliterated.Q2_K.gguf|3281734720|af7e99bb61ea2a0dfd0f828088b3b20b7d08315242e94b2ddc020a5c89c55f28") ;;
    "Q3_K_L") FILES=("Qwen3-VL-8B-Instruct-abliterated.Q3_K_L.gguf|4431395904|4a8e52ceaefe9946d8c83bc4e064a568dac0b3365f1ad84b01739b950449d6ea") ;;
    "Q3_K_M") FILES=("Qwen3-VL-8B-Instruct-abliterated.Q3_K_M.gguf|4124163136|126516df4ab91b5a33f8a12258f777f6e1042157a4c741d823d14b144263e5d0") ;;
    "Q3_K_S") FILES=("Qwen3-VL-8B-Instruct-abliterated.Q3_K_S.gguf|3769613376|aa5f9aa07aaa5f5ab7e6e27a2bfb4847f2e8626e19a96a99d5aa74e93b8540d3") ;;
    "Q4_K_M") FILES=("Qwen3-VL-8B-Instruct-abliterated.Q4_K_M.gguf|5027785792|713d7cfeb8e1eccb3c92838c26d3fc5c99d238ce161caa3b3d5e3133ec491f42") ;;
    "Q4_K_S") FILES=("Qwen3-VL-8B-Instruct-abliterated.Q4_K_S.gguf|4802014272|2960e95966d84237173d4744de4cbcb420bf4f5cabf05bf56bf53901fe47ce2c") ;;
    "Q5_K_M") FILES=("Qwen3-VL-8B-Instruct-abliterated.Q5_K_M.gguf|5851114560|6bead04b1b589e3cee4bc9dbc2e4a4c07fa5e38cb3212a4020d8e7e55d7423ca") ;;
    "Q5_K_S") FILES=("Qwen3-VL-8B-Instruct-abliterated.Q5_K_S.gguf|5720763456|d55a7f428c601a1611e9ebe66cbed99eb8cb38b6ac5a33e35d35ea11efbf8e82") ;;
    "Q6_K") FILES=("Qwen3-VL-8B-Instruct-abliterated.Q6_K.gguf|6725901376|ccca1cd47d48c6e596b56eb0f17f3a94613aa25a251adc6b127d7cfb063eab16") ;;
    "Q8_0") FILES=("Qwen3-VL-8B-Instruct-abliterated.Q8_0.gguf|8709520448|58c5b9afa8f873b35574ddb0d51c2a87151309aa745843d0a89951d24f663f12") ;;
    "IQ4_XS") FILES=("Qwen3-VL-8B-Instruct-abliterated.IQ4_XS.gguf|4593298496|615420502b47d014363650ef29812fb199a61e3970d754ddd3820d292f2b5bd2") ;;
    "f16") FILES=("Qwen3-VL-8B-Instruct-abliterated.f16.gguf|16388045888|b5f2adaa3e7f3595987dafa5f224491e7c7e81c71008ecb718adc6dd72666755") ;;
    *) echo "Unknown quant: $QUANT" >&2; usage >&2; exit 1 ;;
  esac
fi


# Recompute total size robustly
TOTAL=0
for e in "${FILES[@]}"; do sz="${e#*|}"; sz="${sz%%|*}"; TOTAL=$((TOTAL + sz)); done
echo "Total download size: $TOTAL bytes (~$(awk -v b="$TOTAL" 'BEGIN {printf "%.2f", b/1000000000}') GB)"
echo "Make sure you have enough free disk space before continuing."

download_one() {
  local entry="$1"; local file="${entry%%|*}"; local rest="${entry#*|}"; local size="${rest%%|*}"; local sha="${rest##*|}"
  echo "Downloading $file ($size bytes) ..."
  curl -L --fail --retry 3 -o "$file.tmp" "$BASE/$file"
  local got; got=$(stat -c%s "$file.tmp")
  if [ "$got" != "$size" ]; then echo "SIZE MISMATCH for $file: got $got, expected $size" >&2; rm -f "$file.tmp"; exit 1; fi
  local gotsha; gotsha=$(sha256sum "$file.tmp" | cut -d" " -f1)
  if [ "$gotsha" != "$sha" ]; then echo "SHA256 MISMATCH for $file: got $gotsha, expected $sha" >&2; rm -f "$file.tmp"; exit 1; fi
  mv "$file.tmp" "$file"
  echo "OK $file"
}

for e in "${FILES[@]}"; do download_one "$e"; done
echo "All files downloaded and verified."
