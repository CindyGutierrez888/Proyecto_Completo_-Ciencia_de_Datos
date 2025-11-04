# 🧠 Proyecto de Ciencia de Datos – Empresa de Tratamiento de Telas

**Clustering, Visualización y Predicciones de Ventas**

---

## 📘 Descripción General

Este proyecto muestra **todo el ciclo de Ciencia de Datos**, desde la limpieza de datos hasta la creación de modelos predictivos y visualizaciones interactivas.  
Se trabajó con datos **reales** proporcionados por una **empresa mexicana dedicada a la producción y venta de limpiadores y tratamientos para tela y ropa**, incluyendo cloro, suavizantes y tratamientos de color.

El análisis abarca:
- Limpieza y transformación de datos con **Pandas**  
- Análisis Exploratorio (EDA) y visualización con **Matplotlib**  
- Segmentación de productos con **K-Means (Scikit-learn)**  
- Consultas e insights mediante **SQL**  
- Modelo de predicción de ventas con **SARIMAX (statsmodels)**  
- Dashboard interactivo con **Power BI**

---

## 🧩 Estructura del Proyecto

📂 Proyecto_Telas/
│
├── 📁 data/ # Datasets originales y limpios
├── 📁 notebooks/ # Jupyter Notebooks con el flujo completo
├── 📁 sql/ # Consultas SQL utilizadas para el análisis
├── 📁 visualizaciones/ # Imágenes y gráficos
├── 📁 powerbi/ # Dashboard interactivo (.pbix)
└── README.md # Documentación principal

yaml
Copiar código

---

## 🧹 Limpieza y Preparación de Datos

- Eliminación de duplicados y valores nulos (`drop_duplicates()`, `dropna()`)
- Unión de tablas con `merge()` y `concat()`
- Agrupaciones semanales con `groupby()`
- Análisis de formato y categorías (marca, formato, segmento)

El dataset principal contiene:
- 497 productos  
- 32 marcas  
- 5 formatos  
- 7 regiones  
- Más de **122,000 registros de ventas**  

---

## 🔍 Análisis Exploratorio (EDA)

Durante el EDA se identificaron patrones clave:

- Las **ventas presentan tendencias repetitivas** por año.
- El año **2023** superó las ventas de 2022, aunque con faltantes en mitad del año.
- El formato **“Barra”** fue el más vendido, pero **el formato líquido generó más ingresos**.
- La **Región “Autos Scanning México”** fue la más rentable, superando por más del triple a las demás.
- La **marca Vanish** destacó en 2022, reduciendo presencia en 2023.

---

## 🤖 Segmentación con K-Means

- Se probaron **de 2 a 5 clusters**, el mejor resultado se obtuvo con **2 clusters** (según el coeficiente de silueta).
- Los grupos se dividen principalmente **por precios y volumen de ventas**.

**Hallazgos clave:**
- El **Grupo 1**: productos menos exitosos, principalmente **líquidos** y de pocas marcas (Cloralex, Blancatel, Puro Sol).  
- El **Grupo 2**: productos con **mayor volumen e ingresos**, formatos variados y marcas líderes como **La Japonesa, Vanish y Lysol**.

---

## 🧮 Consultas SQL

Las consultas SQL permitieron confirmar y profundizar los hallazgos:

- Número total de productos: **503**
- Segmentos: **7**  
- Regiones: **7**
- Mayor volumen de ventas: **Región Autos Scanning México**
- **Top 3 semanas** de mayores ventas: coinciden en las **semanas 22 de 2022 y 2023**

---

## 📊 Dashboard Interactivo (Power BI)

El dashboard diseñado en Power BI permite visualizar:

- Tendencias de ventas por región y formato  
- Top productos y marcas  
- Comparativas por año  
- Evolución temporal y métricas clave  

Incluye dos páginas principales:  
1. **Ventas por Región y Formato**  
2. **Comparativa de Ventas y Crecimiento**

---

## 📈 Modelo Predictivo (SARIMAX)

- Se utilizó un modelo **SARIMAX** para predecir las ventas del producto más vendido:  
  **“Cloralex El Rendidor – Botella 2L”**
- La serie temporal fue dividida en entrenamiento (80%) y prueba (20%).
- Las predicciones **siguen la tendencia real casi de manera exacta**, mostrando un excelente ajuste.

🔮 También se proyectaron las ventas para los **2 meses siguientes** mediante simulación de la variable `X`.

---

## 🧾 Conclusiones

- Las regiones y formatos mantienen **patrones de venta consistentes**.
- Existe una **saturación de productos líquidos**, especialmente de cloro.
- El formato **barra** domina en cantidad, pero no en valor total de ventas.
- Las **marcas líderes** muestran consistencia interanual.
- El modelo predictivo **SARIMAX** es una herramienta útil para planificar producción y ventas futuras.
- El **dashboard Power BI** facilita la toma de decisiones y seguimiento.

---

## 🚀 Próximos Pasos

1. Ajustar la selección de variables y probar modelos con más features.  
2. Ampliar el número de clusters para segmentaciones más específicas.  
3. Actualizar el dataset con fechas recientes.  
4. Profundizar en análisis de precios, elasticidad y promociones.

---

## 🧰 Tecnologías Utilizadas

| Herramienta | Uso |
|--------------|-----|
| **Python** | Limpieza, análisis y modelado |
| **Pandas** | Manipulación de datos |
| **Matplotlib / Seaborn** | Visualización de datos |
| **Scikit-learn** | Clustering y métricas |
| **Statsmodels** | Modelado ARIMA/SARIMAX |
| **SQL** | Consultas y extracción de insights |
| **Power BI** | Visualización interactiva |

---

## 👩‍💻 Autoría

**Proyecto desarrollado por:**  
🌿 *Cindy Gutiérrez*  
📍 *México*  
📧 github.com/CindyGutierrez888
  Instagram/cindy_disco
  linkedin.com/in/cindy-data-science/
✨ *Ciencia de Datos aplicada a la empresa y al entendimiento de patrones reales de mercado.*

---

## 📂 Recursos Adicionales

- 📊 [Dashboard Power BI](#) *(opcional, si lo compartes en línea)*  
- 📓 [Notebook principal (.ipynb)](#)  
- 🗃️ [Consultas SQL](#)

---


