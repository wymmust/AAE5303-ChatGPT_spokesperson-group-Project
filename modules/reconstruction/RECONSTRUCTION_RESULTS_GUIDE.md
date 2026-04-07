# AAE5303 - Reconstruction Results Guide

## 📁 Reconstruction Inputs

The reconstruction module uses COLMAP-format inputs and OpenSplat training.

Current input sources:

| Input | Description |
|-------|-------------|
| `baseline/colmap_from_amtown02` | Richer COLMAP input used for the strongest reconstruction-quality result |
| `baseline/colmap_from_vo` | VO-connected COLMAP input used to test the end-to-end group pipeline |

---

## 📊 Final Result Structure

Each final reconstruction result is described by:

- Input source
- Iteration count
- Output scene file
- Camera pose count
- Vertex count
- File size

### Main reconstruction result

```json
{
  "result_name": "main_reconstruction",
  "input_source": "colmap_from_amtown02",
  "scene_file": "results/amtown02_quality_balanced_6000.ply",
  "iterations": 6000,
  "camera_poses": 292,
  "vertices": 704292,
  "size_mb": 166.57
}
```

### VO-connected reconstruction result

```json
{
  "result_name": "vo_connected_reconstruction",
  "input_source": "colmap_from_vo",
  "scene_file": "results/amtown02_vo_refined_25000/scene_gpu_safe_n25000_d3.ply",
  "iterations": 25000,
  "camera_poses": 65,
  "vertices": 3555460,
  "size_mb": 352.64
}
```

---

## 💡 How to interpret the results

### Main reconstruction result

- Strongest result for scene quality
- Better camera coverage
- Better overall completeness

### VO-connected reconstruction result

- Strongest result for module integration
- Uses fewer camera poses
- More sensitive to upstream VO quality

---

## 🔢 Lightweight summaries

This module generates two lightweight summary files:

- `results/RESULT_SUMMARY.md`
- `results/reconstruction_summary.json`

These files are recommended for GitHub uploads because they preserve key metrics without committing large binary scene files.

---

## ✅ Recommended GitHub-safe result files

- `results/RESULT_SUMMARY.md`
- `results/reconstruction_summary.json`
- `results/baseline_report.json`
