import './index.css';

export default function IndexPage() {
  return (
    <>
      <div className="text-red-500 flex grayscale-1">
        <div className="w-64">
          --tw-grayscale: grayscale(100%);
          <br />
          filter: var(--tw-grayscale)
        </div>
        <div>生效</div>
      </div>

      <hr />

      <div className="text-red-500 flex grayscale-2">
        <div className="w-64">
          --tw-xxx: ;<br />
          --tw-grayscale: grayscale(100%);
          <br />
          filter: var(--tw-grayscale) var(--tw-xxx)
        </div>
        <div>build后不生效（start时生效）</div>
      </div>
    </>
  );
}
