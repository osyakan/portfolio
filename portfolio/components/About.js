// components/About.js
export default function About({ data }) {
  return (
    <div>
      <h2>{data.title}</h2>
      <p>{data.description}</p>
      {/* 必要に応じて、その他の項目も表示 */}
    </div>
  );
}
