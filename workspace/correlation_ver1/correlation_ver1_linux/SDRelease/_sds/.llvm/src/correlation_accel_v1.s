; ModuleID = '/home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/src/correlation_accel_v1.cpp'
target datalayout = "e-m:e-p:32:32-i64:64-v128:64:128-n32-S64"
target triple = "armv7-xilinx-linux-gnueabi"

%"class.std::ios_base::Init" = type { i8 }

@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1
@__dso_handle = external global i8
@_ZZ20correlation_accel_v1iiPfS_E10weight_rom = internal global [252 x float] zeroinitializer, align 4
@_ZZ20correlation_accel_v1iiPfS_E5bramA = internal global [252 x float] zeroinitializer, align 4
@_ZZ20correlation_accel_v1iiPfS_E5bramB = internal global [252 x float] zeroinitializer, align 4
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_correlation_accel_v1.cpp, i8* null }]

define internal void @__cxx_global_var_init() section ".text.startup" {
  %1 = call %"class.std::ios_base::Init"* @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* @_ZStL8__ioinit), !dbg !115
  %2 = call i32 @__cxa_atexit(void (i8*)* bitcast (%"class.std::ios_base::Init"* (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init"* @_ZStL8__ioinit, i32 0, i32 0), i8* @__dso_handle) #1, !dbg !115
  ret void, !dbg !115
}

declare %"class.std::ios_base::Init"* @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* returned) #0

declare %"class.std::ios_base::Init"* @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"* returned) #0

; Function Attrs: nounwind
declare i32 @__cxa_atexit(void (i8*)*, i8*, i8*) #1

define i32 @_Z20correlation_accel_v1iiPfS_(i32 %number_of_days, i32 %number_of_indices, float* %in_indices, float* %out_correlation) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca float*, align 4
  %4 = alloca float*, align 4
  %NUMBER_OF_DAYS = alloca i32, align 4
  %NUMBER_OF_INDICES = alloca i32, align 4
  %counter = alloca i32, align 4
  %row_index = alloca i32, align 4
  %column_index = alloca i32, align 4
  %acc_returnA = alloca [6 x float], align 4
  %acc_returnB = alloca [6 x float], align 4
  %acc_weight_returnSquareA = alloca [6 x float], align 4
  %acc_weight_returnA = alloca [6 x float], align 4
  %acc_weight_returnSquareB = alloca [6 x float], align 4
  %acc_weight_returnB = alloca [6 x float], align 4
  %acc_weight_returnA_returnB = alloca [6 x float], align 4
  %i = alloca i32, align 4
  %i1 = alloca i32, align 4
  %lnReturnA = alloca float, align 4
  %lnReturnB = alloca float, align 4
  %weight = alloca float, align 4
  %sum_returnA = alloca float, align 4
  %sum_returnB = alloca float, align 4
  %sum_weight_returnSquareA = alloca float, align 4
  %sum_weight_returnA = alloca float, align 4
  %sum_weight_returnSquareB = alloca float, align 4
  %sum_weight_returnB = alloca float, align 4
  %sum_weight_returnA_returnB = alloca float, align 4
  %sum_weight = alloca float, align 4
  %i2 = alloca i32, align 4
  %meanReturn1 = alloca float, align 4
  %meanReturn2 = alloca float, align 4
  %volatilityA = alloca float, align 4
  %volatilityB = alloca float, align 4
  %covariance = alloca float, align 4
  %corr_temp = alloca float, align 4
  store i32 %number_of_days, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !116), !dbg !117
  store i32 %number_of_indices, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !118), !dbg !119
  store float* %in_indices, float** %3, align 4
  call void @llvm.dbg.declare(metadata !{float** %3}, metadata !120), !dbg !121
  store float* %out_correlation, float** %4, align 4
  call void @llvm.dbg.declare(metadata !{float** %4}, metadata !122), !dbg !123
  call void @llvm.dbg.declare(metadata !{i32* %NUMBER_OF_DAYS}, metadata !124), !dbg !125
  %5 = load i32* %1, align 4, !dbg !126
  store i32 %5, i32* %NUMBER_OF_DAYS, align 4, !dbg !126
  call void @llvm.dbg.declare(metadata !{i32* %NUMBER_OF_INDICES}, metadata !127), !dbg !128
  %6 = load i32* %2, align 4, !dbg !129
  store i32 %6, i32* %NUMBER_OF_INDICES, align 4, !dbg !129
  call void @llvm.dbg.declare(metadata !{i32* %counter}, metadata !130), !dbg !131
  store i32 0, i32* %counter, align 4, !dbg !132
  %7 = load i32* %NUMBER_OF_DAYS, align 4, !dbg !133
  call void @_ZL15weight_rom_initPfi(float* getelementptr inbounds ([252 x float]* @_ZZ20correlation_accel_v1iiPfS_E10weight_rom, i32 0, i32 0), i32 %7), !dbg !133
  br label %8, !dbg !133

; <label>:8                                       ; preds = %0
  call void @llvm.dbg.declare(metadata !{i32* %row_index}, metadata !134), !dbg !136
  store i32 0, i32* %row_index, align 4, !dbg !137
  br label %9, !dbg !137

; <label>:9                                       ; preds = %264, %8
  %10 = load i32* %row_index, align 4, !dbg !138
  %11 = load i32* %NUMBER_OF_INDICES, align 4, !dbg !138
  %12 = sub nsw i32 %11, 1, !dbg !138
  %13 = icmp slt i32 %10, %12, !dbg !138
  br i1 %13, label %14, label %267, !dbg !138

; <label>:14                                      ; preds = %9
  %15 = load i32* %NUMBER_OF_DAYS, align 4, !dbg !141
  %16 = load i32* %row_index, align 4, !dbg !141
  %17 = mul nsw i32 %15, %16, !dbg !141
  %18 = load float** %3, align 4, !dbg !141
  %19 = getelementptr inbounds float* %18, i32 %17, !dbg !141
  %20 = bitcast float* %19 to i8*, !dbg !141
  %21 = load i32* %NUMBER_OF_DAYS, align 4, !dbg !141
  %22 = mul i32 %21, 4, !dbg !141
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* bitcast ([252 x float]* @_ZZ20correlation_accel_v1iiPfS_E5bramA to i8*), i8* %20, i32 %22, i32 4, i1 false), !dbg !141
  br label %23, !dbg !141

; <label>:23                                      ; preds = %14
  call void @llvm.dbg.declare(metadata !{i32* %column_index}, metadata !143), !dbg !145
  %24 = load i32* %row_index, align 4, !dbg !146
  %25 = add nsw i32 %24, 1, !dbg !146
  store i32 %25, i32* %column_index, align 4, !dbg !146
  br label %26, !dbg !146

; <label>:26                                      ; preds = %260, %23
  %27 = load i32* %column_index, align 4, !dbg !147
  %28 = load i32* %NUMBER_OF_INDICES, align 4, !dbg !147
  %29 = icmp slt i32 %27, %28, !dbg !147
  br i1 %29, label %30, label %263, !dbg !147

; <label>:30                                      ; preds = %26
  %31 = load i32* %NUMBER_OF_DAYS, align 4, !dbg !150
  %32 = load i32* %column_index, align 4, !dbg !150
  %33 = mul nsw i32 %31, %32, !dbg !150
  %34 = load float** %3, align 4, !dbg !150
  %35 = getelementptr inbounds float* %34, i32 %33, !dbg !150
  %36 = bitcast float* %35 to i8*, !dbg !150
  %37 = load i32* %NUMBER_OF_DAYS, align 4, !dbg !150
  %38 = mul i32 %37, 4, !dbg !150
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* bitcast ([252 x float]* @_ZZ20correlation_accel_v1iiPfS_E5bramB to i8*), i8* %36, i32 %38, i32 4, i1 false), !dbg !150
  call void @llvm.dbg.declare(metadata !{[6 x float]* %acc_returnA}, metadata !152), !dbg !156
  call void @llvm.dbg.declare(metadata !{[6 x float]* %acc_returnB}, metadata !157), !dbg !158
  call void @llvm.dbg.declare(metadata !{[6 x float]* %acc_weight_returnSquareA}, metadata !159), !dbg !160
  call void @llvm.dbg.declare(metadata !{[6 x float]* %acc_weight_returnA}, metadata !161), !dbg !162
  call void @llvm.dbg.declare(metadata !{[6 x float]* %acc_weight_returnSquareB}, metadata !163), !dbg !164
  call void @llvm.dbg.declare(metadata !{[6 x float]* %acc_weight_returnB}, metadata !165), !dbg !166
  call void @llvm.dbg.declare(metadata !{[6 x float]* %acc_weight_returnA_returnB}, metadata !167), !dbg !168
  br label %39, !dbg !169

; <label>:39                                      ; preds = %30
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !170), !dbg !172
  store i32 0, i32* %i, align 4, !dbg !173
  br label %40, !dbg !173

; <label>:40                                      ; preds = %58, %39
  %41 = load i32* %i, align 4, !dbg !174
  %42 = icmp slt i32 %41, 6, !dbg !174
  br i1 %42, label %43, label %61, !dbg !174

; <label>:43                                      ; preds = %40
  %44 = load i32* %i, align 4, !dbg !177
  %45 = getelementptr inbounds [6 x float]* %acc_returnA, i32 0, i32 %44, !dbg !177
  store float 0.000000e+00, float* %45, align 4, !dbg !177
  %46 = load i32* %i, align 4, !dbg !179
  %47 = getelementptr inbounds [6 x float]* %acc_returnB, i32 0, i32 %46, !dbg !179
  store float 0.000000e+00, float* %47, align 4, !dbg !179
  %48 = load i32* %i, align 4, !dbg !180
  %49 = getelementptr inbounds [6 x float]* %acc_weight_returnSquareA, i32 0, i32 %48, !dbg !180
  store float 0.000000e+00, float* %49, align 4, !dbg !180
  %50 = load i32* %i, align 4, !dbg !181
  %51 = getelementptr inbounds [6 x float]* %acc_weight_returnA, i32 0, i32 %50, !dbg !181
  store float 0.000000e+00, float* %51, align 4, !dbg !181
  %52 = load i32* %i, align 4, !dbg !182
  %53 = getelementptr inbounds [6 x float]* %acc_weight_returnSquareB, i32 0, i32 %52, !dbg !182
  store float 0.000000e+00, float* %53, align 4, !dbg !182
  %54 = load i32* %i, align 4, !dbg !183
  %55 = getelementptr inbounds [6 x float]* %acc_weight_returnB, i32 0, i32 %54, !dbg !183
  store float 0.000000e+00, float* %55, align 4, !dbg !183
  %56 = load i32* %i, align 4, !dbg !184
  %57 = getelementptr inbounds [6 x float]* %acc_weight_returnA_returnB, i32 0, i32 %56, !dbg !184
  store float 0.000000e+00, float* %57, align 4, !dbg !184
  br label %58, !dbg !185

; <label>:58                                      ; preds = %43
  %59 = load i32* %i, align 4, !dbg !186
  %60 = add nsw i32 %59, 1, !dbg !186
  store i32 %60, i32* %i, align 4, !dbg !186
  br label %40, !dbg !186

; <label>:61                                      ; preds = %40
  br label %62, !dbg !187

; <label>:62                                      ; preds = %61
  call void @llvm.dbg.declare(metadata !{i32* %i1}, metadata !188), !dbg !190
  store i32 0, i32* %i1, align 4, !dbg !191
  br label %63, !dbg !191

; <label>:63                                      ; preds = %149, %62
  %64 = load i32* %i1, align 4, !dbg !192
  %65 = load i32* %NUMBER_OF_DAYS, align 4, !dbg !192
  %66 = sub nsw i32 %65, 1, !dbg !192
  %67 = icmp slt i32 %64, %66, !dbg !192
  br i1 %67, label %68, label %152, !dbg !192

; <label>:68                                      ; preds = %63
  call void @llvm.dbg.declare(metadata !{float* %lnReturnA}, metadata !195), !dbg !197
  %69 = load i32* %i1, align 4, !dbg !198
  %70 = getelementptr inbounds [252 x float]* @_ZZ20correlation_accel_v1iiPfS_E5bramA, i32 0, i32 %69, !dbg !198
  %71 = load float* %70, align 4, !dbg !198
  %72 = load i32* %i1, align 4, !dbg !198
  %73 = add nsw i32 %72, 1, !dbg !198
  %74 = getelementptr inbounds [252 x float]* @_ZZ20correlation_accel_v1iiPfS_E5bramA, i32 0, i32 %73, !dbg !198
  %75 = load float* %74, align 4, !dbg !198
  %76 = fdiv float %71, %75, !dbg !198
  %77 = call float @logf(float %76) #1, !dbg !198
  store float %77, float* %lnReturnA, align 4, !dbg !198
  call void @llvm.dbg.declare(metadata !{float* %lnReturnB}, metadata !199), !dbg !200
  %78 = load i32* %i1, align 4, !dbg !201
  %79 = getelementptr inbounds [252 x float]* @_ZZ20correlation_accel_v1iiPfS_E5bramB, i32 0, i32 %78, !dbg !201
  %80 = load float* %79, align 4, !dbg !201
  %81 = load i32* %i1, align 4, !dbg !201
  %82 = add nsw i32 %81, 1, !dbg !201
  %83 = getelementptr inbounds [252 x float]* @_ZZ20correlation_accel_v1iiPfS_E5bramB, i32 0, i32 %82, !dbg !201
  %84 = load float* %83, align 4, !dbg !201
  %85 = fdiv float %80, %84, !dbg !201
  %86 = call float @logf(float %85) #1, !dbg !201
  store float %86, float* %lnReturnB, align 4, !dbg !201
  call void @llvm.dbg.declare(metadata !{float* %weight}, metadata !202), !dbg !203
  %87 = load i32* %i1, align 4, !dbg !204
  %88 = add nsw i32 %87, 1, !dbg !204
  %89 = getelementptr inbounds [252 x float]* @_ZZ20correlation_accel_v1iiPfS_E10weight_rom, i32 0, i32 %88, !dbg !204
  %90 = load float* %89, align 4, !dbg !204
  store float %90, float* %weight, align 4, !dbg !204
  %91 = load float* %lnReturnA, align 4, !dbg !205
  %92 = load i32* %i1, align 4, !dbg !205
  %93 = srem i32 %92, 6, !dbg !205
  %94 = getelementptr inbounds [6 x float]* %acc_returnA, i32 0, i32 %93, !dbg !205
  %95 = load float* %94, align 4, !dbg !205
  %96 = fadd float %95, %91, !dbg !205
  store float %96, float* %94, align 4, !dbg !205
  %97 = load float* %lnReturnB, align 4, !dbg !206
  %98 = load i32* %i1, align 4, !dbg !206
  %99 = srem i32 %98, 6, !dbg !206
  %100 = getelementptr inbounds [6 x float]* %acc_returnB, i32 0, i32 %99, !dbg !206
  %101 = load float* %100, align 4, !dbg !206
  %102 = fadd float %101, %97, !dbg !206
  store float %102, float* %100, align 4, !dbg !206
  %103 = load float* %lnReturnA, align 4, !dbg !207
  %104 = load float* %lnReturnA, align 4, !dbg !207
  %105 = fmul float %103, %104, !dbg !207
  %106 = load float* %weight, align 4, !dbg !207
  %107 = fmul float %105, %106, !dbg !207
  %108 = load i32* %i1, align 4, !dbg !207
  %109 = srem i32 %108, 6, !dbg !207
  %110 = getelementptr inbounds [6 x float]* %acc_weight_returnSquareA, i32 0, i32 %109, !dbg !207
  %111 = load float* %110, align 4, !dbg !207
  %112 = fadd float %111, %107, !dbg !207
  store float %112, float* %110, align 4, !dbg !207
  %113 = load float* %lnReturnB, align 4, !dbg !208
  %114 = load float* %lnReturnB, align 4, !dbg !208
  %115 = fmul float %113, %114, !dbg !208
  %116 = load float* %weight, align 4, !dbg !208
  %117 = fmul float %115, %116, !dbg !208
  %118 = load i32* %i1, align 4, !dbg !208
  %119 = srem i32 %118, 6, !dbg !208
  %120 = getelementptr inbounds [6 x float]* %acc_weight_returnSquareB, i32 0, i32 %119, !dbg !208
  %121 = load float* %120, align 4, !dbg !208
  %122 = fadd float %121, %117, !dbg !208
  store float %122, float* %120, align 4, !dbg !208
  %123 = load float* %lnReturnA, align 4, !dbg !209
  %124 = load float* %weight, align 4, !dbg !209
  %125 = fmul float %123, %124, !dbg !209
  %126 = load i32* %i1, align 4, !dbg !209
  %127 = srem i32 %126, 6, !dbg !209
  %128 = getelementptr inbounds [6 x float]* %acc_weight_returnA, i32 0, i32 %127, !dbg !209
  %129 = load float* %128, align 4, !dbg !209
  %130 = fadd float %129, %125, !dbg !209
  store float %130, float* %128, align 4, !dbg !209
  %131 = load float* %lnReturnB, align 4, !dbg !210
  %132 = load float* %weight, align 4, !dbg !210
  %133 = fmul float %131, %132, !dbg !210
  %134 = load i32* %i1, align 4, !dbg !210
  %135 = srem i32 %134, 6, !dbg !210
  %136 = getelementptr inbounds [6 x float]* %acc_weight_returnB, i32 0, i32 %135, !dbg !210
  %137 = load float* %136, align 4, !dbg !210
  %138 = fadd float %137, %133, !dbg !210
  store float %138, float* %136, align 4, !dbg !210
  %139 = load float* %lnReturnA, align 4, !dbg !211
  %140 = load float* %lnReturnB, align 4, !dbg !211
  %141 = fmul float %139, %140, !dbg !211
  %142 = load float* %weight, align 4, !dbg !211
  %143 = fmul float %141, %142, !dbg !211
  %144 = load i32* %i1, align 4, !dbg !211
  %145 = srem i32 %144, 6, !dbg !211
  %146 = getelementptr inbounds [6 x float]* %acc_weight_returnA_returnB, i32 0, i32 %145, !dbg !211
  %147 = load float* %146, align 4, !dbg !211
  %148 = fadd float %147, %143, !dbg !211
  store float %148, float* %146, align 4, !dbg !211
  br label %149, !dbg !212

; <label>:149                                     ; preds = %68
  %150 = load i32* %i1, align 4, !dbg !213
  %151 = add nsw i32 %150, 1, !dbg !213
  store i32 %151, i32* %i1, align 4, !dbg !213
  br label %63, !dbg !213

; <label>:152                                     ; preds = %63
  call void @llvm.dbg.declare(metadata !{float* %sum_returnA}, metadata !214), !dbg !215
  store float 0.000000e+00, float* %sum_returnA, align 4, !dbg !216
  call void @llvm.dbg.declare(metadata !{float* %sum_returnB}, metadata !217), !dbg !218
  store float 0.000000e+00, float* %sum_returnB, align 4, !dbg !219
  call void @llvm.dbg.declare(metadata !{float* %sum_weight_returnSquareA}, metadata !220), !dbg !221
  store float 0.000000e+00, float* %sum_weight_returnSquareA, align 4, !dbg !222
  call void @llvm.dbg.declare(metadata !{float* %sum_weight_returnA}, metadata !223), !dbg !224
  store float 0.000000e+00, float* %sum_weight_returnA, align 4, !dbg !225
  call void @llvm.dbg.declare(metadata !{float* %sum_weight_returnSquareB}, metadata !226), !dbg !227
  store float 0.000000e+00, float* %sum_weight_returnSquareB, align 4, !dbg !228
  call void @llvm.dbg.declare(metadata !{float* %sum_weight_returnB}, metadata !229), !dbg !230
  store float 0.000000e+00, float* %sum_weight_returnB, align 4, !dbg !231
  call void @llvm.dbg.declare(metadata !{float* %sum_weight_returnA_returnB}, metadata !232), !dbg !233
  store float 0.000000e+00, float* %sum_weight_returnA_returnB, align 4, !dbg !234
  call void @llvm.dbg.declare(metadata !{float* %sum_weight}, metadata !235), !dbg !236
  %153 = load float* getelementptr inbounds ([252 x float]* @_ZZ20correlation_accel_v1iiPfS_E10weight_rom, i32 0, i32 0), align 4, !dbg !237
  store float %153, float* %sum_weight, align 4, !dbg !237
  br label %154, !dbg !237

; <label>:154                                     ; preds = %152
  call void @llvm.dbg.declare(metadata !{i32* %i2}, metadata !238), !dbg !240
  store i32 0, i32* %i2, align 4, !dbg !241
  br label %155, !dbg !241

; <label>:155                                     ; preds = %194, %154
  %156 = load i32* %i2, align 4, !dbg !242
  %157 = icmp slt i32 %156, 6, !dbg !242
  br i1 %157, label %158, label %197, !dbg !242

; <label>:158                                     ; preds = %155
  %159 = load i32* %i2, align 4, !dbg !245
  %160 = getelementptr inbounds [6 x float]* %acc_returnA, i32 0, i32 %159, !dbg !245
  %161 = load float* %160, align 4, !dbg !245
  %162 = load float* %sum_returnA, align 4, !dbg !245
  %163 = fadd float %162, %161, !dbg !245
  store float %163, float* %sum_returnA, align 4, !dbg !245
  %164 = load i32* %i2, align 4, !dbg !247
  %165 = getelementptr inbounds [6 x float]* %acc_returnB, i32 0, i32 %164, !dbg !247
  %166 = load float* %165, align 4, !dbg !247
  %167 = load float* %sum_returnB, align 4, !dbg !247
  %168 = fadd float %167, %166, !dbg !247
  store float %168, float* %sum_returnB, align 4, !dbg !247
  %169 = load i32* %i2, align 4, !dbg !248
  %170 = getelementptr inbounds [6 x float]* %acc_weight_returnSquareA, i32 0, i32 %169, !dbg !248
  %171 = load float* %170, align 4, !dbg !248
  %172 = load float* %sum_weight_returnSquareA, align 4, !dbg !248
  %173 = fadd float %172, %171, !dbg !248
  store float %173, float* %sum_weight_returnSquareA, align 4, !dbg !248
  %174 = load i32* %i2, align 4, !dbg !249
  %175 = getelementptr inbounds [6 x float]* %acc_weight_returnA, i32 0, i32 %174, !dbg !249
  %176 = load float* %175, align 4, !dbg !249
  %177 = load float* %sum_weight_returnA, align 4, !dbg !249
  %178 = fadd float %177, %176, !dbg !249
  store float %178, float* %sum_weight_returnA, align 4, !dbg !249
  %179 = load i32* %i2, align 4, !dbg !250
  %180 = getelementptr inbounds [6 x float]* %acc_weight_returnSquareB, i32 0, i32 %179, !dbg !250
  %181 = load float* %180, align 4, !dbg !250
  %182 = load float* %sum_weight_returnSquareB, align 4, !dbg !250
  %183 = fadd float %182, %181, !dbg !250
  store float %183, float* %sum_weight_returnSquareB, align 4, !dbg !250
  %184 = load i32* %i2, align 4, !dbg !251
  %185 = getelementptr inbounds [6 x float]* %acc_weight_returnB, i32 0, i32 %184, !dbg !251
  %186 = load float* %185, align 4, !dbg !251
  %187 = load float* %sum_weight_returnB, align 4, !dbg !251
  %188 = fadd float %187, %186, !dbg !251
  store float %188, float* %sum_weight_returnB, align 4, !dbg !251
  %189 = load i32* %i2, align 4, !dbg !252
  %190 = getelementptr inbounds [6 x float]* %acc_weight_returnA_returnB, i32 0, i32 %189, !dbg !252
  %191 = load float* %190, align 4, !dbg !252
  %192 = load float* %sum_weight_returnA_returnB, align 4, !dbg !252
  %193 = fadd float %192, %191, !dbg !252
  store float %193, float* %sum_weight_returnA_returnB, align 4, !dbg !252
  br label %194, !dbg !253

; <label>:194                                     ; preds = %158
  %195 = load i32* %i2, align 4, !dbg !254
  %196 = add nsw i32 %195, 1, !dbg !254
  store i32 %196, i32* %i2, align 4, !dbg !254
  br label %155, !dbg !254

; <label>:197                                     ; preds = %155
  call void @llvm.dbg.declare(metadata !{float* %meanReturn1}, metadata !255), !dbg !256
  %198 = load float* %sum_returnA, align 4, !dbg !257
  %199 = load i32* %NUMBER_OF_DAYS, align 4, !dbg !257
  %200 = sub nsw i32 %199, 1, !dbg !257
  %201 = sitofp i32 %200 to float, !dbg !257
  %202 = fdiv float %198, %201, !dbg !257
  store float %202, float* %meanReturn1, align 4, !dbg !257
  call void @llvm.dbg.declare(metadata !{float* %meanReturn2}, metadata !258), !dbg !259
  %203 = load float* %sum_returnB, align 4, !dbg !260
  %204 = load i32* %NUMBER_OF_DAYS, align 4, !dbg !260
  %205 = sub nsw i32 %204, 1, !dbg !260
  %206 = sitofp i32 %205 to float, !dbg !260
  %207 = fdiv float %203, %206, !dbg !260
  store float %207, float* %meanReturn2, align 4, !dbg !260
  call void @llvm.dbg.declare(metadata !{float* %volatilityA}, metadata !261), !dbg !262
  %208 = load float* %sum_weight_returnSquareA, align 4, !dbg !263
  %209 = load float* %meanReturn1, align 4, !dbg !263
  %210 = fmul float 2.000000e+00, %209, !dbg !263
  %211 = load float* %sum_weight_returnA, align 4, !dbg !263
  %212 = fmul float %210, %211, !dbg !263
  %213 = fsub float %208, %212, !dbg !263
  %214 = load float* %sum_weight, align 4, !dbg !263
  %215 = fdiv float %213, %214, !dbg !263
  %216 = load float* %meanReturn1, align 4, !dbg !263
  %217 = load float* %meanReturn1, align 4, !dbg !263
  %218 = fmul float %216, %217, !dbg !263
  %219 = fadd float %215, %218, !dbg !263
  %220 = call float @sqrtf(float %219) #1, !dbg !263
  store float %220, float* %volatilityA, align 4, !dbg !263
  call void @llvm.dbg.declare(metadata !{float* %volatilityB}, metadata !264), !dbg !265
  %221 = load float* %sum_weight_returnSquareB, align 4, !dbg !266
  %222 = load float* %meanReturn2, align 4, !dbg !266
  %223 = fmul float 2.000000e+00, %222, !dbg !266
  %224 = load float* %sum_weight_returnB, align 4, !dbg !266
  %225 = fmul float %223, %224, !dbg !266
  %226 = fsub float %221, %225, !dbg !266
  %227 = load float* %sum_weight, align 4, !dbg !266
  %228 = fdiv float %226, %227, !dbg !266
  %229 = load float* %meanReturn2, align 4, !dbg !266
  %230 = load float* %meanReturn2, align 4, !dbg !266
  %231 = fmul float %229, %230, !dbg !266
  %232 = fadd float %228, %231, !dbg !266
  %233 = call float @sqrtf(float %232) #1, !dbg !266
  store float %233, float* %volatilityB, align 4, !dbg !266
  call void @llvm.dbg.declare(metadata !{float* %covariance}, metadata !267), !dbg !268
  %234 = load float* %sum_weight_returnA_returnB, align 4, !dbg !269
  %235 = load float* %meanReturn1, align 4, !dbg !269
  %236 = load float* %sum_weight_returnB, align 4, !dbg !269
  %237 = fmul float %235, %236, !dbg !269
  %238 = fsub float %234, %237, !dbg !269
  %239 = load float* %meanReturn2, align 4, !dbg !269
  %240 = load float* %sum_weight_returnA, align 4, !dbg !269
  %241 = fmul float %239, %240, !dbg !269
  %242 = fsub float %238, %241, !dbg !269
  %243 = load float* %sum_weight, align 4, !dbg !269
  %244 = fdiv float %242, %243, !dbg !269
  %245 = load float* %meanReturn1, align 4, !dbg !269
  %246 = load float* %meanReturn2, align 4, !dbg !269
  %247 = fmul float %245, %246, !dbg !269
  %248 = fadd float %244, %247, !dbg !269
  store float %248, float* %covariance, align 4, !dbg !269
  call void @llvm.dbg.declare(metadata !{float* %corr_temp}, metadata !270), !dbg !271
  %249 = load float* %covariance, align 4, !dbg !272
  %250 = load float* %volatilityA, align 4, !dbg !272
  %251 = load float* %volatilityB, align 4, !dbg !272
  %252 = fmul float %250, %251, !dbg !272
  %253 = fdiv float %249, %252, !dbg !272
  store float %253, float* %corr_temp, align 4, !dbg !272
  %254 = load float* %corr_temp, align 4, !dbg !273
  %255 = load i32* %counter, align 4, !dbg !273
  %256 = load float** %4, align 4, !dbg !273
  %257 = getelementptr inbounds float* %256, i32 %255, !dbg !273
  store float %254, float* %257, align 4, !dbg !273
  %258 = load i32* %counter, align 4, !dbg !274
  %259 = add nsw i32 %258, 1, !dbg !274
  store i32 %259, i32* %counter, align 4, !dbg !274
  br label %260, !dbg !275

; <label>:260                                     ; preds = %197
  %261 = load i32* %column_index, align 4, !dbg !276
  %262 = add nsw i32 %261, 1, !dbg !276
  store i32 %262, i32* %column_index, align 4, !dbg !276
  br label %26, !dbg !276

; <label>:263                                     ; preds = %26
  br label %264, !dbg !277

; <label>:264                                     ; preds = %263
  %265 = load i32* %row_index, align 4, !dbg !278
  %266 = add nsw i32 %265, 1, !dbg !278
  store i32 %266, i32* %row_index, align 4, !dbg !278
  br label %9, !dbg !278

; <label>:267                                     ; preds = %9
  ret i32 0, !dbg !279
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #2

; Function Attrs: nounwind
define internal void @_ZL15weight_rom_initPfi(float* %weightRom, i32 %NUMBER_OF_DAYS) #3 {
  %1 = alloca float*, align 4
  %2 = alloca i32, align 4
  %lambda = alloca float, align 4
  %i = alloca i32, align 4
  %i1 = alloca i32, align 4
  store float* %weightRom, float** %1, align 4
  call void @llvm.dbg.declare(metadata !{float** %1}, metadata !280), !dbg !281
  store i32 %NUMBER_OF_DAYS, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !282), !dbg !283
  call void @llvm.dbg.declare(metadata !{float* %lambda}, metadata !284), !dbg !285
  store float 0x3FEE147AE0000000, float* %lambda, align 4, !dbg !286
  %3 = load float** %1, align 4, !dbg !287
  %4 = getelementptr inbounds float* %3, i32 0, !dbg !287
  store float 1.000000e+00, float* %4, align 4, !dbg !287
  %5 = load float** %1, align 4, !dbg !288
  %6 = getelementptr inbounds float* %5, i32 1, !dbg !288
  store float 1.000000e+00, float* %6, align 4, !dbg !288
  br label %7, !dbg !288

; <label>:7                                       ; preds = %0
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !289), !dbg !291
  store i32 2, i32* %i, align 4, !dbg !292
  br label %8, !dbg !292

; <label>:8                                       ; preds = %22, %7
  %9 = load i32* %i, align 4, !dbg !293
  %10 = icmp slt i32 %9, 252, !dbg !293
  br i1 %10, label %11, label %25, !dbg !293

; <label>:11                                      ; preds = %8
  %12 = load float* %lambda, align 4, !dbg !296
  %13 = load i32* %i, align 4, !dbg !296
  %14 = sub nsw i32 %13, 1, !dbg !296
  %15 = load float** %1, align 4, !dbg !296
  %16 = getelementptr inbounds float* %15, i32 %14, !dbg !296
  %17 = load float* %16, align 4, !dbg !296
  %18 = fmul float %12, %17, !dbg !296
  %19 = load i32* %i, align 4, !dbg !296
  %20 = load float** %1, align 4, !dbg !296
  %21 = getelementptr inbounds float* %20, i32 %19, !dbg !296
  store float %18, float* %21, align 4, !dbg !296
  br label %22, !dbg !298

; <label>:22                                      ; preds = %11
  %23 = load i32* %i, align 4, !dbg !299
  %24 = add nsw i32 %23, 1, !dbg !299
  store i32 %24, i32* %i, align 4, !dbg !299
  br label %8, !dbg !299

; <label>:25                                      ; preds = %8
  br label %26, !dbg !300

; <label>:26                                      ; preds = %25
  call void @llvm.dbg.declare(metadata !{i32* %i1}, metadata !301), !dbg !303
  store i32 2, i32* %i1, align 4, !dbg !304
  br label %27, !dbg !304

; <label>:27                                      ; preds = %40, %26
  %28 = load i32* %i1, align 4, !dbg !305
  %29 = load i32* %2, align 4, !dbg !305
  %30 = icmp slt i32 %28, %29, !dbg !305
  br i1 %30, label %31, label %43, !dbg !305

; <label>:31                                      ; preds = %27
  %32 = load i32* %i1, align 4, !dbg !308
  %33 = load float** %1, align 4, !dbg !308
  %34 = getelementptr inbounds float* %33, i32 %32, !dbg !308
  %35 = load float* %34, align 4, !dbg !308
  %36 = load float** %1, align 4, !dbg !308
  %37 = getelementptr inbounds float* %36, i32 0, !dbg !308
  %38 = load float* %37, align 4, !dbg !308
  %39 = fadd float %38, %35, !dbg !308
  store float %39, float* %37, align 4, !dbg !308
  br label %40, !dbg !310

; <label>:40                                      ; preds = %31
  %41 = load i32* %i1, align 4, !dbg !311
  %42 = add nsw i32 %41, 1, !dbg !311
  store i32 %42, i32* %i1, align 4, !dbg !311
  br label %27, !dbg !311

; <label>:43                                      ; preds = %27
  ret void, !dbg !312
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture, i8* nocapture readonly, i32, i32, i1) #1

; Function Attrs: nounwind
declare float @logf(float) #3

; Function Attrs: nounwind
declare float @sqrtf(float) #3

define internal void @_GLOBAL__sub_I_correlation_accel_v1.cpp() section ".text.startup" {
  call void @__cxx_global_var_init(), !dbg !313
  ret void, !dbg !313
}

attributes #0 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!xidane.function_declaration_type = !{!96, !97, !98, !97, !99, !100, !101, !102, !103, !104, !105, !104}
!xidane.function_declaration_filename = !{!96, !106, !98, !106, !99, !107, !101, !107, !103, !108, !105, !108}
!xidane.function_argument_annotation = !{!99, !109}
!xidane.ExternC = !{!103, !105}
!llvm.module.flags = !{!110, !111, !112, !113}
!llvm.ident = !{!114}

!0 = metadata !{i32 786449, metadata !1, i32 4, metadata !"clang version 3.5.0 (tags/RELEASE_350/final)", i1 false, metadata !"", i32 0, metadata !2, metadata !3, metadata !37, metadata !56, metadata !64, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [/home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/SDRelease/../src/correlation_accel_v1.cpp] [DW_LANG_C_plus_plus]
!1 = metadata !{metadata !"../src/correlation_accel_v1.cpp", metadata !"/home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/SDRelease"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !10, metadata !12, metadata !16, metadata !28}
!4 = metadata !{i32 786451, metadata !5, null, metadata !"", i32 82, i64 64, i64 32, i32 0, i32 0, null, metadata !6, i32 0, null, null, metadata !"_ZTS11__mbstate_t"} ; [ DW_TAG_structure_type ] [line 82, size 64, align 32, offset 0] [def] [from ]
!5 = metadata !{metadata !"/opt/Xilinx/SDSoC/2014.4/SDK/2014.4/gnu/arm/lin/arm-xilinx-linux-gnueabi/libc/usr/include/wchar.h", metadata !"/home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/SDRelease"}
!6 = metadata !{metadata !7, metadata !9}
!7 = metadata !{i32 786445, metadata !5, metadata !"_ZTS11__mbstate_t", metadata !"__count", i32 84, i64 32, i64 32, i64 0, i32 0, metadata !8} ; [ DW_TAG_member ] [__count] [line 84, size 32, align 32, offset 0] [from int]
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786445, metadata !5, metadata !"_ZTS11__mbstate_t", metadata !"__value", i32 93, i64 32, i64 32, i64 32, i32 0, metadata !"_ZTSN11__mbstate_tUt_E"} ; [ DW_TAG_member ] [__value] [line 93, size 32, align 32, offset 32] [from _ZTSN11__mbstate_tUt_E]
!10 = metadata !{i32 786451, metadata !11, null, metadata !"lconv", i32 53, i64 0, i64 0, i32 0, i32 4, null, null, i32 0, null, null, metadata !"_ZTS5lconv"} ; [ DW_TAG_structure_type ] [lconv] [line 53, size 0, align 0, offset 0] [decl] [from ]
!11 = metadata !{metadata !"/opt/Xilinx/SDSoC/2014.4/SDK/2014.4/gnu/arm/lin/arm-xilinx-linux-gnueabi/libc/usr/include/locale.h", metadata !"/home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/SDRelease"}
!12 = metadata !{i32 786434, metadata !13, metadata !14, metadata !"ios_base", i32 199, i64 0, i64 0, i32 0, i32 4, null, null, i32 0, null, null, metadata !"_ZTSSt8ios_base"} ; [ DW_TAG_class_type ] [ios_base] [line 199, size 0, align 0, offset 0] [decl] [from ]
!13 = metadata !{metadata !"/opt/Xilinx/SDSoC/2014.4/SDK/2014.4/gnu/arm/lin/arm-xilinx-linux-gnueabi/include/c++/4.8.3/bits/ios_base.h", metadata !"/home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/SDRelease"}
!14 = metadata !{i32 786489, metadata !15, null, metadata !"std", i32 184} ; [ DW_TAG_namespace ] [std] [line 184]
!15 = metadata !{metadata !"/opt/Xilinx/SDSoC/2014.4/SDK/2014.4/gnu/arm/lin/arm-xilinx-linux-gnueabi/include/c++/4.8.3/arm-xilinx-linux-gnueabi/bits/c++config.h", metadata !"/home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/SDRelease"}
!16 = metadata !{i32 786434, metadata !13, metadata !"_ZTSSt8ios_base", metadata !"Init", i32 533, i64 8, i64 8, i32 0, i32 0, null, metadata !17, i32 0, null, null, metadata !"_ZTSNSt8ios_base4InitE"} ; [ DW_TAG_class_type ] [Init] [line 533, size 8, align 8, offset 0] [def] [from ]
!17 = metadata !{metadata !18, metadata !21, metadata !23, metadata !27}
!18 = metadata !{i32 786445, metadata !13, metadata !"_ZTSNSt8ios_base4InitE", metadata !"_S_refcount", i32 541, i64 0, i64 0, i64 0, i32 4097, metadata !19, null} ; [ DW_TAG_member ] [_S_refcount] [line 541, size 0, align 0, offset 0] [private] [static] [from _Atomic_word]
!19 = metadata !{i32 786454, metadata !20, null, metadata !"_Atomic_word", i32 32, i64 0, i64 0, i64 0, i32 0, metadata !8} ; [ DW_TAG_typedef ] [_Atomic_word] [line 32, size 0, align 0, offset 0] [from int]
!20 = metadata !{metadata !"/opt/Xilinx/SDSoC/2014.4/SDK/2014.4/gnu/arm/lin/arm-xilinx-linux-gnueabi/include/c++/4.8.3/arm-xilinx-linux-gnueabi/bits/atomic_word.h", metadata !"/home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/SDRelease"}
!21 = metadata !{i32 786445, metadata !13, metadata !"_ZTSNSt8ios_base4InitE", metadata !"_S_synced_with_stdio", i32 542, i64 0, i64 0, i64 0, i32 4097, metadata !22, null} ; [ DW_TAG_member ] [_S_synced_with_stdio] [line 542, size 0, align 0, offset 0] [private] [static] [from bool]
!22 = metadata !{i32 786468, null, null, metadata !"bool", i32 0, i64 8, i64 8, i64 0, i32 0, i32 2} ; [ DW_TAG_base_type ] [bool] [line 0, size 8, align 8, offset 0, enc DW_ATE_boolean]
!23 = metadata !{i32 786478, metadata !13, metadata !"_ZTSNSt8ios_base4InitE", metadata !"Init", metadata !"Init", metadata !"", i32 537, metadata !24, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, null, i32 537} ; [ DW_TAG_subprogram ] [line 537] [Init]
!24 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !25, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!25 = metadata !{null, metadata !26}
!26 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 32, i64 32, i64 0, i32 1088, metadata !"_ZTSNSt8ios_base4InitE"} ; [ DW_TAG_pointer_type ] [line 0, size 32, align 32, offset 0] [artificial] [from _ZTSNSt8ios_base4InitE]
!27 = metadata !{i32 786478, metadata !13, metadata !"_ZTSNSt8ios_base4InitE", metadata !"~Init", metadata !"~Init", metadata !"", i32 538, metadata !24, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, null, i32 538} ; [ DW_TAG_subprogram ] [line 538] [~Init]
!28 = metadata !{i32 786455, metadata !5, metadata !"_ZTS11__mbstate_t", metadata !"", i32 85, i64 32, i64 32, i64 0, i32 0, null, metadata !29, i32 0, null, null, metadata !"_ZTSN11__mbstate_tUt_E"} ; [ DW_TAG_union_type ] [line 85, size 32, align 32, offset 0] [def] [from ]
!29 = metadata !{metadata !30, metadata !32}
!30 = metadata !{i32 786445, metadata !5, metadata !"_ZTSN11__mbstate_tUt_E", metadata !"__wch", i32 88, i64 32, i64 32, i64 0, i32 0, metadata !31} ; [ DW_TAG_member ] [__wch] [line 88, size 32, align 32, offset 0] [from unsigned int]
!31 = metadata !{i32 786468, null, null, metadata !"unsigned int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!32 = metadata !{i32 786445, metadata !5, metadata !"_ZTSN11__mbstate_tUt_E", metadata !"__wchb", i32 92, i64 32, i64 8, i64 0, i32 0, metadata !33} ; [ DW_TAG_member ] [__wchb] [line 92, size 32, align 8, offset 0] [from ]
!33 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 32, i64 8, i32 0, i32 0, metadata !34, metadata !35, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 32, align 8, offset 0] [from char]
!34 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_unsigned_char]
!35 = metadata !{metadata !36}
!36 = metadata !{i32 786465, i64 0, i64 4}        ; [ DW_TAG_subrange_type ] [0, 3]
!37 = metadata !{metadata !38, metadata !43, metadata !50, metadata !53}
!38 = metadata !{i32 786478, metadata !39, metadata !40, metadata !"__cxx_global_var_init", metadata !"__cxx_global_var_init", metadata !"", i32 74, metadata !41, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @__cxx_global_var_init, null, null, metadata !2, i32 74} ; [ DW_TAG_subprogram ] [line 74] [local] [def] [__cxx_global_var_init]
!39 = metadata !{metadata !"/opt/Xilinx/SDSoC/2014.4/SDK/2014.4/gnu/arm/lin/arm-xilinx-linux-gnueabi/include/c++/4.8.3/iostream", metadata !"/home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/SDRelease"}
!40 = metadata !{i32 786473, metadata !39}        ; [ DW_TAG_file_type ] [/home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/SDRelease//opt/Xilinx/SDSoC/2014.4/SDK/2014.4/gnu/arm/lin/arm-xilinx-linux-gnueabi/include/c++/4.8.3/iostream]
!41 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !42, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!42 = metadata !{null}
!43 = metadata !{i32 786478, metadata !44, metadata !45, metadata !"correlation_accel_v1", metadata !"correlation_accel_v1", metadata !"_Z20correlation_accel_v1iiPfS_", i32 25, metadata !46, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i32, float*, float*)* @_Z20correlation_accel_v1iiPfS_, null, null, metadata !2, i32 32} ; [ DW_TAG_subprogram ] [line 25] [def] [scope 32] [correlation_accel_v1]
!44 = metadata !{metadata !"/home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/src/correlation_accel_v1.cpp", metadata !"/home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/SDRelease"}
!45 = metadata !{i32 786473, metadata !44}        ; [ DW_TAG_file_type ] [/home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/SDRelease//home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/src/correlation_accel_v1.cpp]
!46 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !47, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!47 = metadata !{metadata !8, metadata !8, metadata !8, metadata !48, metadata !48}
!48 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 32, i64 32, i64 0, i32 0, metadata !49} ; [ DW_TAG_pointer_type ] [line 0, size 32, align 32, offset 0] [from float]
!49 = metadata !{i32 786468, null, null, metadata !"float", i32 0, i64 32, i64 32, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!50 = metadata !{i32 786478, metadata !44, metadata !45, metadata !"weight_rom_init", metadata !"weight_rom_init", metadata !"_ZL15weight_rom_initPfi", i32 195, metadata !51, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (float*, i32)* @_ZL15weight_rom_initPfi, null, null, metadata !2, i32 198} ; [ DW_TAG_subprogram ] [line 195] [local] [def] [scope 198] [weight_rom_init]
!51 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !52, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!52 = metadata !{null, metadata !48, metadata !8}
!53 = metadata !{i32 786478, metadata !1, metadata !54, metadata !"", metadata !"", metadata !"_GLOBAL__sub_I_correlation_accel_v1.cpp", i32 0, metadata !55, i1 true, i1 true, i32 0, i32 0, null, i32 64, i1 false, void ()* @_GLOBAL__sub_I_correlation_accel_v1.cpp, null, null, metadata !2, i32 0} ; [ DW_TAG_subprogram ] [line 0] [local] [def]
!54 = metadata !{i32 786473, metadata !1}         ; [ DW_TAG_file_type ] [/home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/SDRelease/../src/correlation_accel_v1.cpp]
!55 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !2, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!56 = metadata !{metadata !57, metadata !58, metadata !62, metadata !63}
!57 = metadata !{i32 786484, i32 0, metadata !14, metadata !"__ioinit", metadata !"__ioinit", metadata !"_ZStL8__ioinit", metadata !40, i32 74, metadata !"_ZTSNSt8ios_base4InitE", i32 1, i32 1, %"class.std::ios_base::Init"* @_ZStL8__ioinit, null} ; [ DW_TAG_variable ] [__ioinit] [line 74] [local] [def]
!58 = metadata !{i32 786484, i32 0, metadata !43, metadata !"weight_rom", metadata !"weight_rom", metadata !"", metadata !45, i32 45, metadata !59, i32 1, i32 1, [252 x float]* @_ZZ20correlation_accel_v1iiPfS_E10weight_rom, null} ; [ DW_TAG_variable ] [weight_rom] [line 45] [local] [def]
!59 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 8064, i64 32, i32 0, i32 0, metadata !49, metadata !60, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 8064, align 32, offset 0] [from float]
!60 = metadata !{metadata !61}
!61 = metadata !{i32 786465, i64 0, i64 252}      ; [ DW_TAG_subrange_type ] [0, 251]
!62 = metadata !{i32 786484, i32 0, metadata !43, metadata !"bramA", metadata !"bramA", metadata !"", metadata !45, i32 54, metadata !59, i32 1, i32 1, [252 x float]* @_ZZ20correlation_accel_v1iiPfS_E5bramA, null} ; [ DW_TAG_variable ] [bramA] [line 54] [local] [def]
!63 = metadata !{i32 786484, i32 0, metadata !43, metadata !"bramB", metadata !"bramB", metadata !"", metadata !45, i32 55, metadata !59, i32 1, i32 1, [252 x float]* @_ZZ20correlation_accel_v1iiPfS_E5bramB, null} ; [ DW_TAG_variable ] [bramB] [line 55] [local] [def]
!64 = metadata !{metadata !65, metadata !69, metadata !73, metadata !75, metadata !78, metadata !81, metadata !82, metadata !89, metadata !92, metadata !93}
!65 = metadata !{i32 786490, metadata !66, metadata !68, i32 56} ; [ DW_TAG_imported_module ]
!66 = metadata !{i32 786489, metadata !67, null, metadata !"__gnu_debug", i32 54} ; [ DW_TAG_namespace ] [__gnu_debug] [line 54]
!67 = metadata !{metadata !"/opt/Xilinx/SDSoC/2014.4/SDK/2014.4/gnu/arm/lin/arm-xilinx-linux-gnueabi/include/c++/4.8.3/debug/debug.h", metadata !"/home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/SDRelease"}
!68 = metadata !{i32 786489, metadata !67, metadata !14, metadata !"__debug", i32 48} ; [ DW_TAG_namespace ] [__debug] [line 48]
!69 = metadata !{i32 786440, metadata !70, metadata !72, i32 44} ; [ DW_TAG_imported_declaration ]
!70 = metadata !{i32 786489, metadata !71, null, metadata !"__gnu_cxx", i32 68} ; [ DW_TAG_namespace ] [__gnu_cxx] [line 68]
!71 = metadata !{metadata !"/opt/Xilinx/SDSoC/2014.4/SDK/2014.4/gnu/arm/lin/arm-xilinx-linux-gnueabi/include/c++/4.8.3/bits/cpp_type_traits.h", metadata !"/home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/SDRelease"}
!72 = metadata !{i32 786454, metadata !15, metadata !14, metadata !"size_t", i32 186, i64 0, i64 0, i64 0, i32 0, metadata !31} ; [ DW_TAG_typedef ] [size_t] [line 186, size 0, align 0, offset 0] [from unsigned int]
!73 = metadata !{i32 786440, metadata !70, metadata !74, i32 45} ; [ DW_TAG_imported_declaration ]
!74 = metadata !{i32 786454, metadata !15, metadata !14, metadata !"ptrdiff_t", i32 187, i64 0, i64 0, i64 0, i32 0, metadata !8} ; [ DW_TAG_typedef ] [ptrdiff_t] [line 187, size 0, align 0, offset 0] [from int]
!75 = metadata !{i32 786440, metadata !14, metadata !76, i32 64} ; [ DW_TAG_imported_declaration ]
!76 = metadata !{i32 786454, metadata !5, null, metadata !"mbstate_t", i32 106, i64 0, i64 0, i64 0, i32 0, metadata !77} ; [ DW_TAG_typedef ] [mbstate_t] [line 106, size 0, align 0, offset 0] [from __mbstate_t]
!77 = metadata !{i32 786454, metadata !5, null, metadata !"__mbstate_t", i32 94, i64 0, i64 0, i64 0, i32 0, metadata !"_ZTS11__mbstate_t"} ; [ DW_TAG_typedef ] [__mbstate_t] [line 94, size 0, align 0, offset 0] [from _ZTS11__mbstate_t]
!78 = metadata !{i32 786440, metadata !14, metadata !79, i32 139} ; [ DW_TAG_imported_declaration ]
!79 = metadata !{i32 786454, metadata !80, null, metadata !"wint_t", i32 353, i64 0, i64 0, i64 0, i32 0, metadata !31} ; [ DW_TAG_typedef ] [wint_t] [line 353, size 0, align 0, offset 0] [from unsigned int]
!80 = metadata !{metadata !"/opt/Xilinx/SDSoC/2014.4/SDK/2014.4/gnu/arm/lin/lib/gcc/arm-xilinx-linux-gnueabi/4.8.3/include/stddef.h", metadata !"/home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/SDRelease"}
!81 = metadata !{i32 786440, metadata !14, metadata !"_ZTS5lconv", i32 53} ; [ DW_TAG_imported_declaration ]
!82 = metadata !{i32 786440, metadata !14, metadata !83, i32 82} ; [ DW_TAG_imported_declaration ]
!83 = metadata !{i32 786454, metadata !84, null, metadata !"wctrans_t", i32 186, i64 0, i64 0, i64 0, i32 0, metadata !85} ; [ DW_TAG_typedef ] [wctrans_t] [line 186, size 0, align 0, offset 0] [from ]
!84 = metadata !{metadata !"/opt/Xilinx/SDSoC/2014.4/SDK/2014.4/gnu/arm/lin/arm-xilinx-linux-gnueabi/libc/usr/include/wctype.h", metadata !"/home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/SDRelease"}
!85 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 32, i64 32, i64 0, i32 0, metadata !86} ; [ DW_TAG_pointer_type ] [line 0, size 32, align 32, offset 0] [from ]
!86 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !87} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from __int32_t]
!87 = metadata !{i32 786454, metadata !88, null, metadata !"__int32_t", i32 40, i64 0, i64 0, i64 0, i32 0, metadata !8} ; [ DW_TAG_typedef ] [__int32_t] [line 40, size 0, align 0, offset 0] [from int]
!88 = metadata !{metadata !"/opt/Xilinx/SDSoC/2014.4/SDK/2014.4/gnu/arm/lin/arm-xilinx-linux-gnueabi/libc/usr/include/bits/types.h", metadata !"/home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/SDRelease"}
!89 = metadata !{i32 786440, metadata !14, metadata !90, i32 83} ; [ DW_TAG_imported_declaration ]
!90 = metadata !{i32 786454, metadata !84, null, metadata !"wctype_t", i32 52, i64 0, i64 0, i64 0, i32 0, metadata !91} ; [ DW_TAG_typedef ] [wctype_t] [line 52, size 0, align 0, offset 0] [from long unsigned int]
!91 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!92 = metadata !{i32 786440, metadata !14, metadata !79, i32 84} ; [ DW_TAG_imported_declaration ]
!93 = metadata !{i32 786440, metadata !0, metadata !94, i32 673, metadata !"abi"} ; [ DW_TAG_imported_declaration ]
!94 = metadata !{i32 786489, metadata !95, null, metadata !"__cxxabiv1", i32 39} ; [ DW_TAG_namespace ] [__cxxabiv1] [line 39]
!95 = metadata !{metadata !"/opt/Xilinx/SDSoC/2014.4/SDK/2014.4/gnu/arm/lin/arm-xilinx-linux-gnueabi/include/c++/4.8.3/bits/cxxabi_forced.h", metadata !"/home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/SDRelease"}
!96 = metadata !{%"class.std::ios_base::Init"* (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitC1Ev}
!97 = metadata !{metadata !"void."}
!98 = metadata !{%"class.std::ios_base::Init"* (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev}
!99 = metadata !{i32 (i32, i32, float*, float*)* @_Z20correlation_accel_v1iiPfS_}
!100 = metadata !{metadata !"int.int.0.int.0.float [2520000].1.float [49995000].1"}
!101 = metadata !{void (float*, i32)* @_ZL15weight_rom_initPfi}
!102 = metadata !{metadata !"void.float [252].1.int.0"}
!103 = metadata !{float (float)* @logf}
!104 = metadata !{metadata !"float.float.0"}
!105 = metadata !{float (float)* @sqrtf}
!106 = metadata !{metadata !"/opt/Xilinx/SDSoC/2014.4/SDK/2014.4/gnu/arm/lin/arm-xilinx-linux-gnueabi/include/c++/4.8.3/bits/ios_base.h"}
!107 = metadata !{metadata !"../src/correlation_accel_v1.hpp"}
!108 = metadata !{metadata !"/opt/Xilinx/SDSoC/2014.4/SDK/2014.4/gnu/arm/lin/arm-xilinx-linux-gnueabi/libc/usr/include/bits/mathcalls.h"}
!109 = metadata !{metadata !"in_indices,,,,,AFI,,, out_correlation,,,,,AFI,,, "}
!110 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!111 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!112 = metadata !{i32 1, metadata !"wchar_size", i32 4}
!113 = metadata !{i32 1, metadata !"min_enum_size", i32 4}
!114 = metadata !{metadata !"clang version 3.5.0 (tags/RELEASE_350/final)"}
!115 = metadata !{i32 74, i32 25, metadata !38, null}
!116 = metadata !{i32 786689, metadata !43, metadata !"number_of_days", metadata !45, i32 16777242, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [number_of_days] [line 26]
!117 = metadata !{i32 26, i32 7, metadata !43, null}
!118 = metadata !{i32 786689, metadata !43, metadata !"number_of_indices", metadata !45, i32 33554459, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [number_of_indices] [line 27]
!119 = metadata !{i32 27, i32 7, metadata !43, null}
!120 = metadata !{i32 786689, metadata !43, metadata !"in_indices", metadata !45, i32 50331677, metadata !48, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [in_indices] [line 29]
!121 = metadata !{i32 29, i32 8, metadata !43, null}
!122 = metadata !{i32 786689, metadata !43, metadata !"out_correlation", metadata !45, i32 67108894, metadata !48, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [out_correlation] [line 30]
!123 = metadata !{i32 30, i32 10, metadata !43, null}
!124 = metadata !{i32 786688, metadata !43, metadata !"NUMBER_OF_DAYS", metadata !45, i32 39, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [NUMBER_OF_DAYS] [line 39]
!125 = metadata !{i32 39, i32 6, metadata !43, null}
!126 = metadata !{i32 39, i32 2, metadata !43, null}
!127 = metadata !{i32 786688, metadata !43, metadata !"NUMBER_OF_INDICES", metadata !45, i32 40, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [NUMBER_OF_INDICES] [line 40]
!128 = metadata !{i32 40, i32 6, metadata !43, null}
!129 = metadata !{i32 40, i32 2, metadata !43, null}
!130 = metadata !{i32 786688, metadata !43, metadata !"counter", metadata !45, i32 41, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [counter] [line 41]
!131 = metadata !{i32 41, i32 6, metadata !43, null}
!132 = metadata !{i32 41, i32 2, metadata !43, null}
!133 = metadata !{i32 46, i32 2, metadata !43, null}
!134 = metadata !{i32 786688, metadata !135, metadata !"row_index", metadata !45, i32 52, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [row_index] [line 52]
!135 = metadata !{i32 786443, metadata !44, metadata !43, i32 52, i32 3, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/SDRelease//home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/src/correlation_accel_v1.cpp]
!136 = metadata !{i32 52, i32 11, metadata !135, null}
!137 = metadata !{i32 52, i32 7, metadata !135, null}
!138 = metadata !{i32 52, i32 7, metadata !139, null}
!139 = metadata !{i32 786443, metadata !44, metadata !140, i32 52, i32 7, i32 2, i32 23} ; [ DW_TAG_lexical_block ] [/home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/SDRelease//home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/src/correlation_accel_v1.cpp]
!140 = metadata !{i32 786443, metadata !44, metadata !135, i32 52, i32 7, i32 1, i32 14} ; [ DW_TAG_lexical_block ] [/home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/SDRelease//home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/src/correlation_accel_v1.cpp]
!141 = metadata !{i32 57, i32 4, metadata !142, null}
!142 = metadata !{i32 786443, metadata !44, metadata !135, i32 52, i32 73, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/SDRelease//home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/src/correlation_accel_v1.cpp]
!143 = metadata !{i32 786688, metadata !144, metadata !"column_index", metadata !45, i32 62, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [column_index] [line 62]
!144 = metadata !{i32 786443, metadata !44, metadata !142, i32 62, i32 5, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/SDRelease//home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/src/correlation_accel_v1.cpp]
!145 = metadata !{i32 62, i32 13, metadata !144, null}
!146 = metadata !{i32 62, i32 9, metadata !144, null}
!147 = metadata !{i32 62, i32 9, metadata !148, null}
!148 = metadata !{i32 786443, metadata !44, metadata !149, i32 62, i32 9, i32 2, i32 22} ; [ DW_TAG_lexical_block ] [/home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/SDRelease//home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/src/correlation_accel_v1.cpp]
!149 = metadata !{i32 786443, metadata !44, metadata !144, i32 62, i32 9, i32 1, i32 15} ; [ DW_TAG_lexical_block ] [/home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/SDRelease//home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/src/correlation_accel_v1.cpp]
!150 = metadata !{i32 64, i32 6, metadata !151, null}
!151 = metadata !{i32 786443, metadata !44, metadata !144, i32 62, i32 92, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/SDRelease//home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/src/correlation_accel_v1.cpp]
!152 = metadata !{i32 786688, metadata !151, metadata !"acc_returnA", metadata !45, i32 69, metadata !153, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [acc_returnA] [line 69]
!153 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 192, i64 32, i32 0, i32 0, metadata !49, metadata !154, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 192, align 32, offset 0] [from float]
!154 = metadata !{metadata !155}
!155 = metadata !{i32 786465, i64 0, i64 6}       ; [ DW_TAG_subrange_type ] [0, 5]
!156 = metadata !{i32 69, i32 12, metadata !151, null}
!157 = metadata !{i32 786688, metadata !151, metadata !"acc_returnB", metadata !45, i32 70, metadata !153, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [acc_returnB] [line 70]
!158 = metadata !{i32 70, i32 12, metadata !151, null}
!159 = metadata !{i32 786688, metadata !151, metadata !"acc_weight_returnSquareA", metadata !45, i32 71, metadata !153, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [acc_weight_returnSquareA] [line 71]
!160 = metadata !{i32 71, i32 12, metadata !151, null}
!161 = metadata !{i32 786688, metadata !151, metadata !"acc_weight_returnA", metadata !45, i32 72, metadata !153, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [acc_weight_returnA] [line 72]
!162 = metadata !{i32 72, i32 12, metadata !151, null}
!163 = metadata !{i32 786688, metadata !151, metadata !"acc_weight_returnSquareB", metadata !45, i32 73, metadata !153, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [acc_weight_returnSquareB] [line 73]
!164 = metadata !{i32 73, i32 12, metadata !151, null}
!165 = metadata !{i32 786688, metadata !151, metadata !"acc_weight_returnB", metadata !45, i32 74, metadata !153, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [acc_weight_returnB] [line 74]
!166 = metadata !{i32 74, i32 12, metadata !151, null}
!167 = metadata !{i32 786688, metadata !151, metadata !"acc_weight_returnA_returnB", metadata !45, i32 75, metadata !153, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [acc_weight_returnA_returnB] [line 75]
!168 = metadata !{i32 75, i32 12, metadata !151, null}
!169 = metadata !{i32 75, i32 6, metadata !151, null}
!170 = metadata !{i32 786688, metadata !171, metadata !"i", metadata !45, i32 82, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 82]
!171 = metadata !{i32 786443, metadata !44, metadata !151, i32 82, i32 6, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/SDRelease//home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/src/correlation_accel_v1.cpp]
!172 = metadata !{i32 82, i32 14, metadata !171, null}
!173 = metadata !{i32 82, i32 10, metadata !171, null}
!174 = metadata !{i32 82, i32 10, metadata !175, null}
!175 = metadata !{i32 786443, metadata !44, metadata !176, i32 82, i32 10, i32 2, i32 17} ; [ DW_TAG_lexical_block ] [/home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/SDRelease//home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/src/correlation_accel_v1.cpp]
!176 = metadata !{i32 786443, metadata !44, metadata !171, i32 82, i32 10, i32 1, i32 16} ; [ DW_TAG_lexical_block ] [/home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/SDRelease//home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/src/correlation_accel_v1.cpp]
!177 = metadata !{i32 84, i32 7, metadata !178, null}
!178 = metadata !{i32 786443, metadata !44, metadata !171, i32 82, i32 45, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/SDRelease//home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/src/correlation_accel_v1.cpp]
!179 = metadata !{i32 85, i32 7, metadata !178, null}
!180 = metadata !{i32 86, i32 7, metadata !178, null}
!181 = metadata !{i32 87, i32 7, metadata !178, null}
!182 = metadata !{i32 88, i32 7, metadata !178, null}
!183 = metadata !{i32 89, i32 7, metadata !178, null}
!184 = metadata !{i32 90, i32 7, metadata !178, null}
!185 = metadata !{i32 91, i32 6, metadata !178, null}
!186 = metadata !{i32 82, i32 41, metadata !171, null}
!187 = metadata !{i32 91, i32 6, metadata !171, null}
!188 = metadata !{i32 786688, metadata !189, metadata !"i", metadata !45, i32 98, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 98]
!189 = metadata !{i32 786443, metadata !44, metadata !151, i32 98, i32 6, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/SDRelease//home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/src/correlation_accel_v1.cpp]
!190 = metadata !{i32 98, i32 14, metadata !189, null}
!191 = metadata !{i32 98, i32 10, metadata !189, null}
!192 = metadata !{i32 98, i32 10, metadata !193, null}
!193 = metadata !{i32 786443, metadata !44, metadata !194, i32 98, i32 10, i32 2, i32 19} ; [ DW_TAG_lexical_block ] [/home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/SDRelease//home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/src/correlation_accel_v1.cpp]
!194 = metadata !{i32 786443, metadata !44, metadata !189, i32 98, i32 10, i32 1, i32 18} ; [ DW_TAG_lexical_block ] [/home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/SDRelease//home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/src/correlation_accel_v1.cpp]
!195 = metadata !{i32 786688, metadata !196, metadata !"lnReturnA", metadata !45, i32 101, metadata !49, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [lnReturnA] [line 101]
!196 = metadata !{i32 786443, metadata !44, metadata !189, i32 98, i32 49, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/SDRelease//home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/src/correlation_accel_v1.cpp]
!197 = metadata !{i32 101, i32 13, metadata !196, null}
!198 = metadata !{i32 101, i32 27, metadata !196, null}
!199 = metadata !{i32 786688, metadata !196, metadata !"lnReturnB", metadata !45, i32 102, metadata !49, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [lnReturnB] [line 102]
!200 = metadata !{i32 102, i32 13, metadata !196, null}
!201 = metadata !{i32 102, i32 27, metadata !196, null}
!202 = metadata !{i32 786688, metadata !196, metadata !"weight", metadata !45, i32 103, metadata !49, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [weight] [line 103]
!203 = metadata !{i32 103, i32 13, metadata !196, null}
!204 = metadata !{i32 103, i32 7, metadata !196, null}
!205 = metadata !{i32 106, i32 7, metadata !196, null}
!206 = metadata !{i32 107, i32 7, metadata !196, null}
!207 = metadata !{i32 110, i32 7, metadata !196, null}
!208 = metadata !{i32 111, i32 7, metadata !196, null}
!209 = metadata !{i32 114, i32 7, metadata !196, null}
!210 = metadata !{i32 115, i32 7, metadata !196, null}
!211 = metadata !{i32 118, i32 7, metadata !196, null}
!212 = metadata !{i32 120, i32 6, metadata !196, null}
!213 = metadata !{i32 98, i32 45, metadata !189, null}
!214 = metadata !{i32 786688, metadata !151, metadata !"sum_returnA", metadata !45, i32 122, metadata !49, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sum_returnA] [line 122]
!215 = metadata !{i32 122, i32 12, metadata !151, null}
!216 = metadata !{i32 122, i32 6, metadata !151, null}
!217 = metadata !{i32 786688, metadata !151, metadata !"sum_returnB", metadata !45, i32 123, metadata !49, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sum_returnB] [line 123]
!218 = metadata !{i32 123, i32 12, metadata !151, null}
!219 = metadata !{i32 123, i32 6, metadata !151, null}
!220 = metadata !{i32 786688, metadata !151, metadata !"sum_weight_returnSquareA", metadata !45, i32 124, metadata !49, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sum_weight_returnSquareA] [line 124]
!221 = metadata !{i32 124, i32 12, metadata !151, null}
!222 = metadata !{i32 124, i32 6, metadata !151, null}
!223 = metadata !{i32 786688, metadata !151, metadata !"sum_weight_returnA", metadata !45, i32 125, metadata !49, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sum_weight_returnA] [line 125]
!224 = metadata !{i32 125, i32 12, metadata !151, null}
!225 = metadata !{i32 125, i32 6, metadata !151, null}
!226 = metadata !{i32 786688, metadata !151, metadata !"sum_weight_returnSquareB", metadata !45, i32 126, metadata !49, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sum_weight_returnSquareB] [line 126]
!227 = metadata !{i32 126, i32 12, metadata !151, null}
!228 = metadata !{i32 126, i32 6, metadata !151, null}
!229 = metadata !{i32 786688, metadata !151, metadata !"sum_weight_returnB", metadata !45, i32 127, metadata !49, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sum_weight_returnB] [line 127]
!230 = metadata !{i32 127, i32 12, metadata !151, null}
!231 = metadata !{i32 127, i32 6, metadata !151, null}
!232 = metadata !{i32 786688, metadata !151, metadata !"sum_weight_returnA_returnB", metadata !45, i32 128, metadata !49, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sum_weight_returnA_returnB] [line 128]
!233 = metadata !{i32 128, i32 12, metadata !151, null}
!234 = metadata !{i32 128, i32 6, metadata !151, null}
!235 = metadata !{i32 786688, metadata !151, metadata !"sum_weight", metadata !45, i32 129, metadata !49, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sum_weight] [line 129]
!236 = metadata !{i32 129, i32 12, metadata !151, null}
!237 = metadata !{i32 129, i32 6, metadata !151, null}
!238 = metadata !{i32 786688, metadata !239, metadata !"i", metadata !45, i32 131, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 131]
!239 = metadata !{i32 786443, metadata !44, metadata !151, i32 131, i32 6, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/SDRelease//home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/src/correlation_accel_v1.cpp]
!240 = metadata !{i32 131, i32 14, metadata !239, null}
!241 = metadata !{i32 131, i32 10, metadata !239, null}
!242 = metadata !{i32 131, i32 10, metadata !243, null}
!243 = metadata !{i32 786443, metadata !44, metadata !244, i32 131, i32 10, i32 2, i32 21} ; [ DW_TAG_lexical_block ] [/home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/SDRelease//home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/src/correlation_accel_v1.cpp]
!244 = metadata !{i32 786443, metadata !44, metadata !239, i32 131, i32 10, i32 1, i32 20} ; [ DW_TAG_lexical_block ] [/home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/SDRelease//home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/src/correlation_accel_v1.cpp]
!245 = metadata !{i32 133, i32 7, metadata !246, null}
!246 = metadata !{i32 786443, metadata !44, metadata !239, i32 131, i32 45, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/SDRelease//home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/src/correlation_accel_v1.cpp]
!247 = metadata !{i32 134, i32 7, metadata !246, null}
!248 = metadata !{i32 135, i32 7, metadata !246, null}
!249 = metadata !{i32 136, i32 7, metadata !246, null}
!250 = metadata !{i32 137, i32 7, metadata !246, null}
!251 = metadata !{i32 138, i32 7, metadata !246, null}
!252 = metadata !{i32 139, i32 7, metadata !246, null}
!253 = metadata !{i32 140, i32 6, metadata !246, null}
!254 = metadata !{i32 131, i32 41, metadata !239, null}
!255 = metadata !{i32 786688, metadata !151, metadata !"meanReturn1", metadata !45, i32 145, metadata !49, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [meanReturn1] [line 145]
!256 = metadata !{i32 145, i32 12, metadata !151, null}
!257 = metadata !{i32 145, i32 6, metadata !151, null}
!258 = metadata !{i32 786688, metadata !151, metadata !"meanReturn2", metadata !45, i32 146, metadata !49, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [meanReturn2] [line 146]
!259 = metadata !{i32 146, i32 12, metadata !151, null}
!260 = metadata !{i32 146, i32 6, metadata !151, null}
!261 = metadata !{i32 786688, metadata !151, metadata !"volatilityA", metadata !45, i32 148, metadata !49, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [volatilityA] [line 148]
!262 = metadata !{i32 148, i32 12, metadata !151, null}
!263 = metadata !{i32 148, i32 26, metadata !151, null}
!264 = metadata !{i32 786688, metadata !151, metadata !"volatilityB", metadata !45, i32 151, metadata !49, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [volatilityB] [line 151]
!265 = metadata !{i32 151, i32 12, metadata !151, null}
!266 = metadata !{i32 151, i32 26, metadata !151, null}
!267 = metadata !{i32 786688, metadata !151, metadata !"covariance", metadata !45, i32 154, metadata !49, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [covariance] [line 154]
!268 = metadata !{i32 154, i32 12, metadata !151, null}
!269 = metadata !{i32 154, i32 6, metadata !151, null}
!270 = metadata !{i32 786688, metadata !151, metadata !"corr_temp", metadata !45, i32 158, metadata !49, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [corr_temp] [line 158]
!271 = metadata !{i32 158, i32 12, metadata !151, null}
!272 = metadata !{i32 159, i32 6, metadata !151, null}
!273 = metadata !{i32 161, i32 6, metadata !151, null}
!274 = metadata !{i32 163, i32 6, metadata !151, null}
!275 = metadata !{i32 164, i32 5, metadata !151, null}
!276 = metadata !{i32 62, i32 77, metadata !144, null}
!277 = metadata !{i32 165, i32 3, metadata !142, null}
!278 = metadata !{i32 52, i32 61, metadata !135, null}
!279 = metadata !{i32 166, i32 2, metadata !43, null}
!280 = metadata !{i32 786689, metadata !50, metadata !"weightRom", metadata !45, i32 16777412, metadata !48, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [weightRom] [line 196]
!281 = metadata !{i32 196, i32 9, metadata !50, null}
!282 = metadata !{i32 786689, metadata !50, metadata !"NUMBER_OF_DAYS", metadata !45, i32 33554629, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [NUMBER_OF_DAYS] [line 197]
!283 = metadata !{i32 197, i32 7, metadata !50, null}
!284 = metadata !{i32 786688, metadata !50, metadata !"lambda", metadata !45, i32 199, metadata !49, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [lambda] [line 199]
!285 = metadata !{i32 199, i32 8, metadata !50, null}
!286 = metadata !{i32 199, i32 2, metadata !50, null}
!287 = metadata !{i32 200, i32 2, metadata !50, null}
!288 = metadata !{i32 201, i32 2, metadata !50, null}
!289 = metadata !{i32 786688, metadata !290, metadata !"i", metadata !45, i32 204, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 204]
!290 = metadata !{i32 786443, metadata !44, metadata !50, i32 204, i32 2, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/SDRelease//home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/src/correlation_accel_v1.cpp]
!291 = metadata !{i32 204, i32 10, metadata !290, null}
!292 = metadata !{i32 204, i32 6, metadata !290, null}
!293 = metadata !{i32 204, i32 6, metadata !294, null}
!294 = metadata !{i32 786443, metadata !44, metadata !295, i32 204, i32 6, i32 2, i32 25} ; [ DW_TAG_lexical_block ] [/home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/SDRelease//home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/src/correlation_accel_v1.cpp]
!295 = metadata !{i32 786443, metadata !44, metadata !290, i32 204, i32 6, i32 1, i32 24} ; [ DW_TAG_lexical_block ] [/home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/SDRelease//home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/src/correlation_accel_v1.cpp]
!296 = metadata !{i32 205, i32 3, metadata !297, null}
!297 = metadata !{i32 786443, metadata !44, metadata !290, i32 204, i32 41, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/SDRelease//home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/src/correlation_accel_v1.cpp]
!298 = metadata !{i32 206, i32 2, metadata !297, null}
!299 = metadata !{i32 204, i32 36, metadata !290, null}
!300 = metadata !{i32 206, i32 2, metadata !290, null}
!301 = metadata !{i32 786688, metadata !302, metadata !"i", metadata !45, i32 209, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 209]
!302 = metadata !{i32 786443, metadata !44, metadata !50, i32 209, i32 2, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/SDRelease//home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/src/correlation_accel_v1.cpp]
!303 = metadata !{i32 209, i32 10, metadata !302, null}
!304 = metadata !{i32 209, i32 6, metadata !302, null}
!305 = metadata !{i32 209, i32 6, metadata !306, null}
!306 = metadata !{i32 786443, metadata !44, metadata !307, i32 209, i32 6, i32 2, i32 27} ; [ DW_TAG_lexical_block ] [/home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/SDRelease//home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/src/correlation_accel_v1.cpp]
!307 = metadata !{i32 786443, metadata !44, metadata !302, i32 209, i32 6, i32 1, i32 26} ; [ DW_TAG_lexical_block ] [/home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/SDRelease//home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/src/correlation_accel_v1.cpp]
!308 = metadata !{i32 210, i32 3, metadata !309, null}
!309 = metadata !{i32 786443, metadata !44, metadata !302, i32 209, i32 41, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/SDRelease//home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/src/correlation_accel_v1.cpp]
!310 = metadata !{i32 212, i32 2, metadata !309, null}
!311 = metadata !{i32 209, i32 37, metadata !302, null}
!312 = metadata !{i32 213, i32 1, metadata !50, null}
!313 = metadata !{i32 0, i32 0, metadata !314, null}
!314 = metadata !{i32 786443, metadata !44, metadata !53} ; [ DW_TAG_lexical_block ] [/home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/SDRelease//home/trungnguyen/SDSoC/workspace/correlation_ver1/correlation_ver1_linux/src/correlation_accel_v1.cpp]
