\version "2.24.3"

% Scan 192, printed p. 167: Gospel tone continued, Matthew 21.
\header { tagline = ##f }
\paper {
  paper-width = 100\mm
  paper-height = 250\mm
  left-margin = 0\mm right-margin = 0\mm
  top-margin = 0\mm bottom-margin = 0\mm
  indent = 0\mm
  print-page-number = ##f
  page-breaking = #ly:one-page-breaking
}
#(set-global-staff-size 18)

\score {
  <<
    \new Staff <<
      \new Voice = "gospel" {
        \clef treble
        \key g \major
        \cadenzaOn
        \slurUp
        \omit Staff.TimeSignature
        \override Score.SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 2)
        a'1 g'1 \bar "|" a'1 a'1 a'1 b'1 a'1 a'1 g'1 \bar "|" a'1 a'1 \bar "|" a'1 a'1 a'1 a'1 a'1 \break
        a'1 g'1 a'1 a'1 \bar "|" a'1 a'1 a'1 a'1 a'1 g'1 a'1 a'1 \bar "|" a'1 a'1 a'1 a'1 \break
        a'1 a'1 a'1 b'1 a'1 a'1 a'1 g'1 g'1 \bar "|" a'1 a'1 a'1 a'1 a'1 a'1 g'1 \break
        a'1 a'1 \bar "|" a'1 a'1 a'1 a'1 a'1 b'1 a'1 a'1 g'1 \bar "|" a'1 a'1 a'1 a'1 a'1 \break
        a'1 a'1 a'1 a'1 a'1 a'1 a'1 a'1 \bar "|" a'1 a'1 a'1 a'1 a'1 g'1 a'1 a'1 \break
        b'1 a'1 a'1 g'1 \bar "|" a'1 a'1 g'1 a'1 \bar "|" a'1 a'1 a'1 a'1 a'1 a'1 b'1 a'1 g'1 \break
        a'1 a'1 a'1 a'1 a'1 a'1 a'1 g'1 \bar "|" a'1 a'1 a'1 a'1 a'1 a'1 a'1 a'1 \break
        b'1 a'1 g'1 \bar "|" a'1 a'1 a'1 a'1 a'1 a'1 a'1 a'1 g'1 a'1 a'1 a'1 \break
        b'1 a'1 g'1 \bar "|" a'1 a'1 a'1 a'1 a'1 g'1 a'1 a'1 a'1 \bar "|" a'1 a'1 a'1 a'1 a'1 \break
        a'1 a'1 a'1 a'1 b'1 a'1 a'1 g'1 \bar "|" \break b'1 b'1 g'1( a'1 b'1) b'1 c''1 b'1 b'1 a'1 \bar "||"
      }
    >>
    \new Lyrics \lyricsto "gospel" {
      \set ignoreMelismata = ##t
      da spricht: Sa -- get der Toch -- ter Zi -- on: Sie -- he, dein Kö -- nig kommt zu
      dir sanft -- mü -- thig und rei -- tet auf ei -- nem E -- sel und auf ei -- nem
      Fül -- len der last -- ba -- ren E -- se -- lin. Die Jün -- ger gin -- gen hin und
      tha -- ten, wie ih -- nen JE -- sus be -- fo -- hlen hat -- te, und brach -- ten die
      E -- se -- lin und das Fül -- len, und leg -- ten ih -- re Klei -- der drauf und
      setz -- ten ihn drauf. A -- ber viel Volks brei -- te -- te die Klei -- der auf den Weg,
      die an -- dern hie -- ben Zwei -- ge von den Bäu -- men und streu -- e -- ten sie
      auf den Weg. Das Volk a -- ber, das vor -- ging und nach -- fol -- ge -- te,
      schrie und sprach: Ho -- si -- an -- na dem Soh -- ne Da -- vid! Ge -- lo -- bet sei, der
      da kommt in dem Na -- men des HErrn! Ho -- si -- an \skip 1 \skip 1 na in der Hö -- he!
    }
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-3 }
  }
}
