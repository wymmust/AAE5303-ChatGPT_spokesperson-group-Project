# AAE5303 - Reconstruction Submission Guide

## 📁 Reconstruction Inputs

The reconstruction module uses COLMAP-format inputs and OpenSplat training.

Current input sources:

| Input | Description |
|-------|-------------|
| `baseline/colmap_from_amtown02` | Richer COLMAP input used as a reference-quality baseline |
| `baseline/colmap_from_vo` | Historical VO-connected COLMAP input kept for legacy reference |
| `baseline/colmap_from_vo_amtown02` | Corrected AMtown02 VO-connected COLMAP input used for the updated reruns |

---

## 📊 Final Result Structure

Each final reconstruction result is described by:

- Input source
- Iteration count
- Output scene file
- Camera pose count
- Vertex count
- File size

### Final selected reconstruction result

```json
{
  "result_name": "vo_connected_reconstruction_corrected_amtown02",
  "input_source": "colmap_from_vo_amtown02",
  "scene_file": "results/amtown02_vo_amtown02_30000/scene_gpu_safe_n30000_d3.ply",
  "iterations": 30000,
  "camera_poses": 622,
  "vertices": 1922747,
  "size_mb": 190.70
}
```

---

## 📈 Iteration Comparison Used In The Report

The updated report should compare the following corrected AMtown02 reruns:

| Version | Scene File | Iterations | Camera Poses | Vertices | Size (MB) |
|--------|------------|-----------:|-------------:|---------:|----------:|
| V0 | `results/amtown02_vo_amtown02_safe/scene_gpu_safe_n500_d3.ply` | 500 | 622 | 50000 | 4.96 |
| V1 | `results/amtown02_vo_amtown02_10000/scene_gpu_safe_n10000_d3.ply` | 10000 | 622 | 1296361 | 128.58 |
| V2 | `results/amtown02_vo_amtown02_20000/scene_gpu_safe_n20000_d3.ply` | 20000 | 622 | 1338941 | 132.80 |
| V3 | `results/amtown02_vo_amtown02_30000/scene_gpu_safe_n30000_d3.ply` | 30000 | 622 | 1922747 | 190.70 |
| V4 | `results/amtown02_vo_amtown02_40000/scene_gpu_safe_n40000_d3.ply` | 40000 | 622 | 1807727 | 179.29 |

Use `V3` as the final selected version in repository-facing documentation.

---

## 📊 Quantitative Trend Analysis

The corrected AMtown02 reruns show that viewer-friendly quality is not strictly monotonic with iteration count.

| Transition | Vertex Gain | Size Gain | Interpretation |
|--------|------------:|----------:|----------------|
| `500 -> 10000` | 1246361 | 123.62 MB | The corrected AMtown02 rerun quickly becomes dense after the initial smoke-test run. |
| `10000 -> 20000` | 42580 | 4.22 MB | A small gain, suggesting limited benefit from doubling this interval. |
| `20000 -> 30000` | 583806 | 57.90 MB | The largest useful improvement among the corrected reruns. |
| `30000 -> 40000` | -115020 | -11.41 MB | The raw file remains valid, but the result becomes less suitable for PlayCanvas viewing. |

Two patterns are important here:

- The input stays fixed at **622 camera poses**, so the change still comes from optimization depth rather than extra viewpoints.
- The longest rerun is not automatically the best presentation artifact once browser-viewer compatibility is considered.

---

## 💡 How to interpret the results

### VO-connected reconstruction result progression

- All updated comparison runs use the same `colmap_from_vo_amtown02` input with 622 camera poses.
- The main variable is the total number of OpenSplat iterations.
- `30000` is the strongest corrected rerun for GitHub presentation and PlayCanvas viewing.
- `40000` remains a valid raw artifact, but can appear blank in PlayCanvas because of a few extreme splat scales.

### Result interpretation

- The selected `30000`-iteration result is the best **VO-connected** reconstruction produced under the corrected AMtown02 input for repository-facing presentation.
- Its main strength is local density growth across the same fixed set of camera poses.
- Its main limitation is that missing viewpoints in the VO input cannot be recovered purely by running more iterations.
- This is why the report now separates "raw longest rerun" from "best browser-visible rerun".

---

## 🛑 Why The Updated Report Prefers 30000

The corrected reruns keep `40000` as a raw experiment artifact, but use `30000` as the main report result for three practical reasons:

- `30000` is the strongest rerun verified to display normally in PlayCanvas.
- `40000` completes successfully, but its viewer behavior is less reliable because of a few very large splat scales.
- The project is being run on an **RTX 3050 Ti 4GB**, so these longer reruns are already substantial local experiments.

---

## 🔢 Lightweight summaries

This module generates two lightweight summary files:

- `results/RESULT_SUMMARY.md`
- `results/reconstruction_summary.json`

These files are recommended for GitHub uploads because they preserve key metrics without committing large binary scene files.

---

## 📂 Repository Result Files

The following lightweight files are intended to stay in the repository:

- `results/RESULT_SUMMARY.md`
- `results/reconstruction_summary.json`
- `results/baseline_report.json`

---

## 📄 Submission Template

Use:

- `final_candidate/submission_template.json`
