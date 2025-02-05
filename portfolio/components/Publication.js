// components/Publication.js
export default function Publication({ data }) {
  return (
    <div>
      <h2>{data.title || "Publications"}</h2>
      <ul>
        {data.items &&
          data.items.map((item, index) => (
            <li key={index}>
              <a href={item.doi} target="_blank" rel="noopener noreferrer">
                {item.title}
              </a>
            </li>
          ))}
      </ul>
    </div>
  );
}
