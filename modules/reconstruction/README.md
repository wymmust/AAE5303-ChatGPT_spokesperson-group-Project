# 3D Reconstruction Module (OpenSplat) — AAE5303 Group Project

This folder contains the **3D reconstruction** part of our AAE5303 group project for low-altitude aerial vehicle perception.

## Context

According to the course design, the final group project integrates three perception components:

- Visual Odometry
- 3D scene reconstruction
- Semantic segmentation

Our group repo is organized accordingly, and this module focuses on the **3D reconstruction / OpenSplat** part on the **AMtown02** sequence.

## Team

- **Evelyn4k4k** — Visual Odometry
- **wymmust** — 3D Reconstruction (this module)
- **taiwanhaitong** — Semantic Segmentation

## Objective

The goal of this module is to run and tune an OpenSplat-based reconstruction pipeline on a selected UAV sequence, generate 3D Gaussian scene outputs from COLMAP-format inputs, compare the main reconstruction result with the VO-connected reconstruction result, and summarize the result in a reproducible way.

This aligns with the course focus on robust spatial perception for low-altitude aerial vehicles, where 3D scene reconstruction is one of the core technical components.

---

## Dataset

- **Sequence**: `AMtown02`
- **Source family**: MARS-LVIG / UAVScenes course pipeline
- **Input modality used in this module**: COLMAP-format sparse reconstruction with image observations

Main external references:

- MARS-LVIG Dataset: `https://mars.hku.hk/dataset.html`
- UAVScenes GitHub: `https://github.com/sijieaaa/UAVScenes`
- OpenSplat: `https://github.com/pierotofy/OpenSplat`

---

## Method

We use **OpenSplat** as the 3D Gaussian scene reconstruction backend.

### Main pipeline

1. Prepare a valid COLMAP-format input.
2. Run OpenSplat with a stable training configuration.
3. Export scene files such as `.ply` or `.splat`.
4. Generate summary artifacts for repository sharing.
5. Select the best main reconstruction result and the best VO-connected reconstruction result.

---

## Folder Structure

```text
reconstruction/
├── README.md
├── docs/
│   ├── RECONSTRUCTION_SUBMISSION_GUIDE.md
│   └── OPENSPLAT_TIPS.md
├── scripts/
│   ├── run_opensplat.sh
│   └── summarize_results.py
├── final_candidate/
│   ├── submission_template.json
│   └── figures/
├── results/
│   ├── RESULT_SUMMARY.md
│   ├── reconstruction_summary.json
│   ├── baseline_report.json
│   ├── amtown02_quality_balanced_6000.ply
│   └── amtown02_vo_refined_25000/scene_gpu_safe_n25000_d3.ply
├── baseline/
└── third_party/
```

---

## Environment

Typical local environment used in this project:

- Ubuntu / WSL2
- Python 3.10+
- OpenSplat built locally
- CUDA-enabled GPU setup for accelerated training

---

## Reproducibility

### 1. Run OpenSplat presets

From this module directory:

```bash
./scripts/run_opensplat.sh amtown02_quality
./scripts/run_opensplat.sh amtown02_compact
./scripts/run_opensplat.sh vo_safe
```

### 2. Generate lightweight summaries

```bash
python3 ./scripts/summarize_results.py
```

### 3. Keep final artifacts

Recommended lightweight repository artifacts:

- `results/RESULT_SUMMARY.md`
- `results/reconstruction_summary.json`
- `results/baseline_report.json`

---

## Final Result

### Best selected main reconstruction result on AMtown02

- **Scene file:** `results/amtown02_quality_balanced_6000.ply`
- **Iterations:** 6000
- **Camera poses:** 292
- **Vertices:** 704292
- **File size:** 166.57 MB

### Best selected VO-connected reconstruction result on AMtown02

- **Scene file:** `results/amtown02_vo_refined_25000/scene_gpu_safe_n25000_d3.ply`
- **Iterations:** 25000
- **Camera poses:** 65
- **Vertices:** 3555460
- **File size:** 352.64 MB

These values are summarized in:

```text
results/baseline_report.json
results/reconstruction_summary.json
```

---

## Experimental Results Comparison

The following table summarizes the two most important reconstruction outcomes in this module.

| Version | Input | Output | Iterations | Camera Poses | Vertices | Notes |
|---|---|---|---:|---:|---:|---|
| V1 | `colmap_from_amtown02` | `amtown02_quality_balanced_6000.ply` | 6000 | 292 | 704292 | Best overall scene quality and completeness. Recommended main reconstruction result. |
| V2 | `colmap_from_vo` | `scene_gpu_safe_n25000_d3.ply` | 25000 | 65 | 3555460 | Best end-to-end group pipeline result. Denser than earlier VO-based runs, but still limited by upstream pose coverage. |

## Discussion

Several important observations can be drawn from the experiments:

1. The richer COLMAP input produced the strongest reconstruction quality because it provides better camera coverage and more stable geometry.
2. The VO-connected result successfully demonstrates the end-to-end connection from visual odometry to reconstruction, but its completeness is constrained by the smaller number of available poses.
3. Increasing OpenSplat iterations significantly improved scene density for the VO-connected result, but it could not replace missing input coverage.
4. Lightweight summaries are much more suitable for GitHub than uploading large `.ply` binaries directly.

## Recommended Final Configuration

Based on the current experiments, the recommended final settings are:

- **Main reconstruction:** `colmap_from_amtown02` with 6000 iterations
- **VO-connected reconstruction:** `colmap_from_vo` with 25000 iterations

This pair was selected because it best represents both:

- The strongest standalone reconstruction quality
- The successful integration between the VO and reconstruction modules

For module-specific documentation, see:

- `docs/RECONSTRUCTION_SUBMISSION_GUIDE.md`
- `docs/OPENSPLAT_TIPS.md`
- `final_candidate/submission_template.json`

## Key Observations

1. Better input camera coverage matters more than simply increasing optimizer iterations.
2. The main reconstruction result is the strongest result for visual quality reporting.
3. The VO-connected result is the strongest result for pipeline integration reporting.
4. GitHub documentation should focus on summaries, scripts, and metadata rather than large local scene binaries.

---

## Notes on Course Integration

The AAE5303 project pipeline progresses from:

- **UAV trajectory / pose estimation**
- **3D mapping**
- **semantic segmentation**
- **higher-level navigation / decision making**

This reconstruction module corresponds to the 3D mapping stage of that perception stack.

---

## Acknowledgements

- Course: **AAE5303 Robust Control Technology in Low-Altitude Aerial Vehicle**
- Instructor: **Dr Li-Ta Hsu**
- Reconstruction baseline: **OpenSplat**
